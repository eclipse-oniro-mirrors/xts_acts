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
import CommonFunc from '../MainAbility/common/Common';
import events_emitter from '@ohos.events.emitter'
import {
  UiComponent,
  UiDriver,
  Component,
  Driver,
  UiWindow,
  ON,
  BY,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';

export default function ExcludeFromRenderGroupDemo() {
  describe('ExcludeFromRenderGroupDemo', () => {
    beforeEach(async (done: Function) => {
      console.info('ExcludeFromRenderGroupDemo beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/ExcludeFromRenderGroupDemo',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get ExcludeFromRenderGroupDemo state pages:' + JSON.stringify(pages));
        if (!('ExcludeFromRenderGroupDemo' == pages.name)) {
          console.info('get ExcludeFromRenderGroupDemo pages.name:' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info('push ExcludeFromRenderGroupDemo page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push ExcludeFromRenderGroupDemo page error:' + err);
      }
      console.info('ExcludeFromRenderGroupDemo beforeEach end');
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('ExcludeFromRenderGroupDemo after each called');
    });

    /**
     * @tc.name   ExcludeFromRenderGroupDemo_001
     * @tc.number ExcludeFromRenderGroupDemo_001
     * @tc.desc   test excludeFromRenderGroup
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ExcludeFromRenderGroupDemo_001', Level.LEVEL0, async (done: Function) => {
      console.info('[ExcludeFromRenderGroupDemo_001] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let strJson = getInspectorByKey('space1');
      let obj: ESObject = JSON.parse(strJson);
      console.info('ExcludeFromRenderGroupDemo_001 component strJson:' + strJson);
      console.info('ExcludeFromRenderGroupDemo_001 component obj is: ' + obj?.$attrs?.excludeFromRenderGroup)
      let strJson2 = getInspectorByKey('space2');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info('ExcludeFromRenderGroupDemo_001 component strJson2:' + strJson2);
      console.info('ExcludeFromRenderGroupDemo_001 component obj2 is: ' + obj2?.$attrs?.excludeFromRenderGroup)
      let strJson3 = getInspectorByKey('space3');
      let obj3: ESObject = JSON.parse(strJson3);
      console.info('ExcludeFromRenderGroupDemo_001 component strJson3:' + strJson3);
      console.info('ExcludeFromRenderGroupDemo_001 component obj3 is: ' + obj3?.$attrs?.excludeFromRenderGroup)
      expect(obj?.$attrs?.excludeFromRenderGroup).assertEqual('false');
      expect(obj2?.$attrs?.excludeFromRenderGroup).assertEqual('true');
      expect(obj3?.$attrs?.excludeFromRenderGroup).assertEqual('false');
      expect(obj?.$attrs?.backgroundColor).assertEqual('#FF2787D9');
      expect(obj2?.$attrs?.backgroundColor).assertEqual('#FF2787D9');
      expect(obj3?.$attrs?.backgroundColor).assertEqual('#FF2787D9');
      console.info('ExcludeFromRenderGroupDemo_001 END');
      done();
    });

    /**
     * @tc.name   ExcludeFromRenderGroupDemo_002
     * @tc.number ExcludeFromRenderGroupDemo_002
     * @tc.desc   test excludeFromRenderGroup
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ExcludeFromRenderGroupDemo_002', Level.LEVEL0, async (done: Function) => {
      console.info('[ExcludeFromRenderGroupDemo_002] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let spaceBtn: Component = await driver.findComponent(ON.id('space1'));
      await spaceBtn.click()
      console.info('[ExcludeFromRenderGroupDemo_002] spaceBtn click');
      await driver.delayMs(2000);

      let strJson = getInspectorByKey('space1');
      let obj: ESObject = JSON.parse(strJson);
      console.info('ExcludeFromRenderGroupDemo_002 component strJson:' + strJson);
      console.info('ExcludeFromRenderGroupDemo_002 component obj is: ' + obj?.$attrs?.excludeFromRenderGroup)
      console.info('ExcludeFromRenderGroupDemo_002 component obj backgroundColor is: ' + obj?.$attrs?.backgroundColor)
      let strJson2 = getInspectorByKey('space2');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info('ExcludeFromRenderGroupDemo_002 component strJson2:' + strJson2);
      console.info('ExcludeFromRenderGroupDemo_002 component obj2 is: ' + obj2?.$attrs?.excludeFromRenderGroup)
      console.info('ExcludeFromRenderGroupDemo_002 component obj2 backgroundColor is: ' + obj2?.$attrs?.backgroundColor)
      let strJson3 = getInspectorByKey('space3');
      let obj3: ESObject = JSON.parse(strJson3);
      console.info('ExcludeFromRenderGroupDemo_002 component strJson3:' + strJson3);
      console.info('ExcludeFromRenderGroupDemo_002 component obj3 is: ' + obj3?.$attrs?.excludeFromRenderGroup)
      console.info('ExcludeFromRenderGroupDemo_002 component obj3 backgroundColor is: ' + obj3?.$attrs?.backgroundColor)
      expect(obj?.$attrs?.excludeFromRenderGroup).assertEqual('false');
      expect(obj2?.$attrs?.excludeFromRenderGroup).assertEqual('true');
      expect(obj3?.$attrs?.excludeFromRenderGroup).assertEqual('false');
      expect(obj?.$attrs?.backgroundColor).assertEqual('#FFFFC000');
      expect(obj2?.$attrs?.backgroundColor).assertEqual('#FFFFC000');
      expect(obj3?.$attrs?.backgroundColor).assertEqual('#FFFFC000');
      console.info('ExcludeFromRenderGroupDemo_001 END');
      done();
    });
  })
}