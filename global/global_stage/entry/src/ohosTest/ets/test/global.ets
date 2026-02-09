import { util } from '@kit.ArkTS';
import { fileIo as fs } from '@kit.CoreFileKit';
//构造单利对象
export class GlobalContext {
  private constructor() {
  }

  private static instance: GlobalContext;
  private _objects = new Map<string, Object>();

  public static getContext(): GlobalContext {
    if (!GlobalContext.instance) {
      GlobalContext.instance = new GlobalContext();
    }
    return GlobalContext.instance;
  }

  getObject(value: string): Object | undefined {
    return this._objects.get(value);
  }

  setObject(key: string, objectClass: Object): void {
    this._objects.set(key, objectClass);
  }
}

export function openPNGWithBase64(path:string): string {
  try {
    let file = fs.openSync(path, fs.OpenMode.READ_ONLY);
    let length = fs.statSync(path).size;
    let buf = new ArrayBuffer(length);
    fs.readSync(file.fd, buf);
    let base64buf = new util.Base64Helper().encodeSync(new Uint8Array(buf));
    return `data:image/png;base64,${String.fromCharCode(...base64buf)}`;
  } catch(error) {
    console.error(error);
  }
  return "";
}