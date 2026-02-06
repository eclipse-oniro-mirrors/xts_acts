'use static'
import { stream } from '@kit.ArkTS';

export let writeSuccess = false;
export class Resettable {
  constructor() {
    writeSuccess = false;
  }
}

export class TestWritable extends stream.Writable {
  constructor() {
    super();
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
    writeSuccess = true;
    console.log(`result: Writable chunk is ` + chunk);
    callback.unsafeCall();
  }
}

export class TestReadable extends stream.Readable {
  constructor() {
    super();
  }

  doRead(size: number) {
  }
}

export class TestDuplex extends stream.Duplex {
  constructor() {
    super();
  }

  doRead(size: number) {
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
    writeSuccess = true;
    console.info('duplexStream chunk is', chunk);
    callback.unsafeCall();
  }
}

export class C1 {
  public name: string = ''
  public age: string = ''
}
