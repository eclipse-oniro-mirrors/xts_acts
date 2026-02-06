/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import {UiComponent, Driver, Component, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import { PersistenceV2, UIUtils } from '@kit.ArkUI';


class ClassAGlobalConnect {
   public propA: string = '';
   public propB: string = '';
}

export default function PersistentStorageGlobalConnect() {
  describe('PersistentStorageGlobalConnect', () => {
    /**
     * @tc.name   PersistentStorageGlobalConnect_002
     * @tc.number PersistentStorageGlobalConnect_002
     * @tc.desc   all keys in PersistentStorage.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PersistentStorageGlobalConnect_002', Level.LEVEL0, async (done: Function) => {
      console.info('[PersistentStorageGlobalConnect_002] START');
      await CommonFunc.sleep(1000);
      let arr: Array<ClassAGlobalConnect> = PersistenceV2.globalConnect({
        type: Array<ClassAGlobalConnect>,
        defaultCreator: () => UIUtils.makeObserved(new Array<ClassAGlobalConnect>()),
        // 添加defaultSubCreator，通知状态管理框架如何创建数组项
        // 另外持久化的数据需要加上makeObserved，因为JSON对象本身没有观察能力，自动持久化会失败
        defaultSubCreator: () => UIUtils.makeObserved(new ClassAGlobalConnect())
      })!
      let temp: ClassAGlobalConnect = new ClassAGlobalConnect();
      temp.propA = 'wwglobalConnect';
      temp.propB = 'b';
      arr.push(temp);
      PersistenceV2.save(ClassAGlobalConnect);
      let test1: string = (PersistenceV2.globalConnect({type: Array<ClassAGlobalConnect>}) as Array<ClassAGlobalConnect>)[0].propA;
      console.info("[PersistentStorageGlobalConnect_002] component test1: " + test1);
      expect(test1).assertEqual('wwglobalConnect');
      let test2: Array<ClassAGlobalConnect> | undefined = PersistenceV2.globalConnect({
        type: Array<ClassAGlobalConnect>,
        key: '',
        defaultCreator: () => UIUtils.makeObserved(new Array<ClassAGlobalConnect>())
      })
      console.info("[PersistentStorageGlobalConnect_002] component test2: " + test2);
      expect(test2).assertEqual(undefined)
      console.info('[PersistentStorageGlobalConnect_002] END');
      done();
    });
    
    
  })
}
