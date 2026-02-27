export type BlogPost = {
  slug: string;
  title: string;
  authored_on: string;
  author: string;
  content: string;
  reading_time: number;
};

export type AboutInfo = {
  name: string;
  title: string;
  years_experience: number;
  years_leading: number;
  summary: string;
  skills: string[];
};

export type BlogPostPreview = {
  slug: string;
  title: string;
  authored_on: string;
  author: string;
  reading_time: number;
  excerpt: string;
};
