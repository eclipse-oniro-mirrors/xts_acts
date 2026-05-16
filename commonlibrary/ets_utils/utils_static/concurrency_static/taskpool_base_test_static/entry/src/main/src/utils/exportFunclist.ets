export function asyncSleep(ms: int): Promise<void> {
  return new Promise<void>((resolve) => {
    setTimeout(() => {
      resolve(undefined);
    }, ms);
  });
}
