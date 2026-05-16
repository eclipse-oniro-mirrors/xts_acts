import { collections } from '@kit.ArkTS'

@Sendable
export class SendableTestClass {
  arr: collections.Array<string>;
  constructor(array: collections.Array<string>) {
    this.arr = array;
  }
}

export class NormalTestClass {
  arr: Array<string>;
  constructor(array: Array<string>) {
    this.arr = array;
  }
}