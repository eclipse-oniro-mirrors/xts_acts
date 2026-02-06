import { ArkTSUtils } from '@kit.ArkTS';

@Sendable
export class ChildLRUCache extends ArkTSUtils.SendableLruCache<number, number> {
  constructor() {
    super();
  }
  createDefault(key: number): number {
    return key;
  }
}