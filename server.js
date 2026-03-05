import express from 'express';
import { readFileSync } from 'fs';
import { fileURLToPath } from 'url';
import { dirname, join } from 'path';

const __dirname = dirname(fileURLToPath(import.meta.url));
const app = express();
const BACKEND_URL = process.env.BACKEND_URL || 'http://localhost:3000';

// HTML 파일 서빙 시 BACKEND_URL 주입
function serveHtml(file) {
  return (req, res) => {
    let html = readFileSync(join(__dirname, 'public', file), 'utf-8');
    html = html.replace(/__BACKEND_URL__/g, BACKEND_URL);
    res.type('html').send(html);
  };
}

app.get('/', serveHtml('index.html'));
app.get('/admin', serveHtml('admin.html'));
app.get('/admin.html', serveHtml('admin.html'));
app.use(express.static(join(__dirname, 'public')));

const PORT = process.env.PORT || 8080;
app.listen(PORT, () => console.log(`Frontend running on port ${PORT}, BACKEND: ${BACKEND_URL}`));
