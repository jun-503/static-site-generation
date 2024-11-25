import matter from 'gray-matter';
import fs from 'fs';
import path from 'path';

export function getPostData(filename) {
  const postsDirectory = path.join(process.cwd(), 'posts');
  const filePath = path.join(postsDirectory, filename);
  const fileContents = fs.readFileSync(filePath, 'utf8');
  return matter(fileContents);
}
