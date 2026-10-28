export function displayDate(value?: string): string {
  if (!value) return "";
  const number = Number(value);
  const date = new Date(Number.isFinite(number) ? number * 1000 : value);
  return Number.isNaN(date.getTime())
    ? ""
    : new Intl.DateTimeFormat("zh-CN", {
        timeZone: "Asia/Shanghai",
        year: "numeric",
        month: "2-digit",
        day: "2-digit",
      }).format(date);
}
