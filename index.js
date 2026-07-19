const express = require('express');
const axios = require('axios');
const app = express();

const SOURCE_URL = 'https://رابط_المصدر_الأصلي.m3u8'; // غيّره هنا

app.get('/stream.m3u8', async (req, res) => {
  try {
    const response = await axios.get(SOURCE_URL, { responseType: 'stream' });
    res.setHeader('Content-Type', 'application/vnd.apple.mpegurl');
    response.data.pipe(res);
  } catch {
    res.status(500).send('المصدر غير متاح');
  }
});

app.get('/:file.ts', async (req, res) => {
  try {
    const tsUrl = SOURCE_URL.replace('index.m3u8', req.params.file);
    const response = await axios.get(tsUrl, { responseType: 'stream' });
    res.setHeader('Content-Type', 'video/mp2t');
    response.data.pipe(res);
  } catch {
    res.status(404).send('غير موجود');
  }
});

app.listen(3000, () => console.log('البث شغال على المنفذ 3000'));
