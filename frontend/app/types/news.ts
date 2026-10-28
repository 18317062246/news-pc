export interface Column {
  Id: number;
  ColumnsName: string;
  Location?: string;
  ChildList?: Column[];
}
export interface Article {
  ID?: number;
  id?: number;
  Title: string;
  Description?: string;
  LitPic?: string;
  PublishDate?: string;
  Sources?: string;
  Source?: string;
  Content?: string;
  Typename?: string;
}
export interface NewsPage {
  items: Article[];
  total: number;
  page: number;
  pageSize: number;
}
