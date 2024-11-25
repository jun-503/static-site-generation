import { getPostData } from '../lib/posts';

export async function getStaticProps() {
  const { data, content } = getPostData('hello-world.md');

  return {
    props: {
      data,
      content,
    },
  };
}

export default function Home({ data, content }) {
  return (
    <div>
      <h1>{data.title}</h1>
      <p>{data.date}</p>
      <div dangerouslySetInnerHTML={{ __html: content }} />
    </div>
  );
}
