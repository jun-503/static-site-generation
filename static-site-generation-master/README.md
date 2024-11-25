# **Static Site Generation Lab**

This project demonstrates the use of **Static Site Generation (SSG)** concepts with **Next.js**. It includes creating dynamic pages from Markdown content and deploying the generated static site to **GitHub Pages**.

---

## **Deployed Site**
🔗 [View the Live Site](https://fsfrahmad.github.io/static-site-generation/)

---

## **Lab Objectives**
- Understand the basics of Static Site Generators (SSG).
- Generate dynamic pages using Markdown files as content.
- Deploy the static site on GitHub Pages.

---

## **Lab Tasks**
### **Lab Part 1: Introduction to Static Site Generators**
1. Learned the benefits of SSG (e.g., speed, simplicity, security).
2. Set up a Next.js environment:
   - Installed required dependencies: `next`, `react`, `react-dom`.
   - Created a basic homepage using `index.js`.

### **Lab Part 2: Creating Dynamic Pages with Markdown**
1. Installed Markdown dependencies:
   ```bash
   npm install gray-matter remark remark-html
   ```
1. Created a posts folder to store Markdown files:

   - Example file: `posts/hello-world.md`

   ```
   ---
   title: "Hello World"
   date: "2024-11-16"
   ---
   
   This is a Markdown file for our static site.
   ```

2. Wrote a utility function to parse Markdown files:

   `lib/posts.js`

   ```
   javascriptCopy codeimport fs from 'fs';
   import path from 'path';
   import matter from 'gray-matter';
   
   const postsDirectory = path.join(process.cwd(), 'posts');
   
   export function getPostData() {
     const filePath = path.join(postsDirectory, 'hello-world.md');
     const fileContents = fs.readFileSync(filePath, 'utf8');
     const { data, content } = matter(fileContents);
     return { data, content };
   }
   ```

3. Rendered Markdown content dynamically:

   `pages/index.js`

   ```
   javascriptCopy codeimport { getPostData } from '../lib/posts';
   
   export default function Home() {
     const { data, content } = getPostData();
     return (
       <div>
         <h1>{data.title}</h1>
         <p>{data.date}</p>
         <div dangerouslySetInnerHTML={{ __html: content }} />
       </div>
     );
   }
   ```

### **Lab Part 3: Deploying a Static Site Using GitHub Pages**

1. Initialized Git and pushed the project to a GitHub repository:

   ```
   git init
   git add .
   git commit -m "Initial commit"
   git branch -M main
   git remote add origin <your-github-repo-url>
   git push -u origin main
   ```

2. Installed gh-pages for deployment:

   ```
   npm install gh-pages --save-dev
   ```

3. Added a deploy script in package.json:

   ```
   "scripts": {
     "deploy": "next build && next export && gh-pages -d out"
   }
   ```

4. Deployed the site:

   ```
   npm run deploy
   ```

------

## **Project Structure**

```
static-site-generation/
├── posts/                     # Contains Markdown files for content
│   ├── hello-world.md         # Example post
│   ├── second-post.md         # Another post
│
├── lib/                       # Helper functions
│   └── posts.js               # Parses Markdown files
│
├── pages/                     # Next.js pages
│   ├── index.js               # Main page listing all posts
│   ├── posts/                 # Dynamic routing for posts
│   │   ├── [slug].js          # Dynamic page for individual posts
│
├── public/                    # Public assets (optional)
│   └── images/                # Static images (if any)
│
├── styles/                    # CSS or Tailwind styles (optional)
│   └── globals.css            # Global styles
│
├── next.config.js             # Next.js configuration
├── package.json               # Project metadata and scripts
├── README.md                  # Project documentation
```

------

## **Learnings**

- **Static Site Generation**: Gained insights into building static sites using Next.js's SSG capabilities.
- **Markdown Integration**: Learned how to parse and use Markdown content dynamically.
- **GitHub Pages Deployment**: Understood the workflow for deploying static sites on GitHub Pages.

------

## **Future Enhancements**

- Add SEO and meta tags using the `<Head>` component.
- Implement a more visually appealing design with CSS or Tailwind CSS.
- Include lazy loading for better performance.

------

## **Acknowledgments**

This project was completed as part of the Software Engineering Lab under the guidance of instructors.