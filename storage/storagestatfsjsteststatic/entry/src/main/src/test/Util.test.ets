export default class Utils{
  static async msSleep(count:int) : Promise<int> {
    return new Promise<int>((resolve, reject) => {
      setTimeout(() => {
        resolve(0)
      }, count)
    })
  }

  static async isIntNum(val:double) : Promise<boolean> {
    return new Promise<boolean>((resolve, reject) => {
      if (typeof val === 'number' && val % 1 === 0) {
        resolve(true);
      } else {
        resolve(false);
      }
    })
  }
}