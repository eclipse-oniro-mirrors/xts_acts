export async function sleep(time:number): Promise<number> {
  return new Promise<number>((resolve): void => {
    setTimeout((): void => {
      resolve(1);
    }, time);
  });
}
@Concurrent
export function printArgs2(args: number): number {
  console.info('printArgs: ' + args);
  return args;
}



