

/**
 * @param obj
 * @returns
 * In TypeScript, the keys of an enum include both the key names and the enum values,
 * so you can count the number of key names to determine the quantity.
 */
export function getEnumCount(obj: Object): int {
  let count = 0;
  Object.values(obj).forEach((v: string | int| Any | Array<Any>) => {
    if (typeof v === 'string') {
      count++;
    }
  });
  return count;
}

export function getRandomNumber(min: number, max: number) {
  return Math.floor(Math.random() * (max - min + 1)) + min;
}

export default class Utils{
  static async msSleep(count:int) : Promise<int> {
    return new Promise<int>((resolve, reject) => {
      setTimeout(() => {
        resolve(0)
      }, count)
    })
  }
}
