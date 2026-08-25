import type { Metadata } from 'next';
import './globals.css';

export const metadata: Metadata = {
  title: 'Algo Arena · 本地算法训练台',
  description: 'CodeTop 前五页与 LeetCode Hot 100 双模式刷题服务',
};

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <html lang="zh-CN"><body>{children}</body></html>
  );
}
