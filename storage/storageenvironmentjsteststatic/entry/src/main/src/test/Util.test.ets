export default class Utils{
  static async msSleep(count:int) : Promise<int> {
    return new Promise<int>((resolve, reject) => {
      setTimeout(() => {
        resolve(0)
      }, count)
    })
  }

  static async isString(str:string) : Promise<boolean> {
    return new Promise<boolean>((resolve, reject) => {
      if (typeof str == 'string') {
        resolve(true);
      } else {
        resolve(false);
      }
    })
  }
}