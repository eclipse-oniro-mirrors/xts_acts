/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import CommonFunc from '../../MainAbility/common/Common';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, Level, expect } from '@ohos/hypium';
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
export default function GetSizeLimitationComponentSnapshot() {
  describe('GetSizeLimitationComponentSnapshot', () => {
    beforeEach(async (done: Function) => {
      console.info('GetSizeLimitationComponentSnapshot beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/getSizeLimitation/GetSizeLimitation',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get GetSizeLimitationComponentSnapshot state pages:' + JSON.stringify(pages));
        if (!('GetSizeLimitationComponentSnapshot' == pages.name)) {
          console.info('get GetSizeLimitationComponentSnapshot pages.name:' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info('push GetSizeLimitationComponentSnapshot page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push GetSizeLimitationComponentSnapshot page error:' + err);
      }
      console.info('GetSizeLimitationComponentSnapshot beforeEach end');
      done();
    });
    afterEach(async () => {
    });

    /**
     * @tc.name   SUB_ACE_ARKUI_GetSizeLimitationComponentSnapshot_0100
     * @tc.number SUB_ACE_ARKUI_GetSizeLimitationComponentSnapshot_0100
     * @tc.desc   SUB_ACE_ARKUI_GetSizeLimitationComponentSnapshot_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_ARKUI_GetSizeLimitationComponentSnapshot_0100', Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ACE_ARKUI_GetSizeLimitationComponentSnapshot_0100 START');
      await CommonFunc.sleep(1000);
      let driver = await Driver.create()
      let button = await driver.findComponent(ON.id('getSizeLimitation1'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strcontent = getInspectorByKey('valueMaxWidth');
      let strcontent2 = getInspectorByKey('valueMaxHeight');
      let obj: ESObject = JSON.parse(strcontent);
      let obj2: ESObject = JSON.parse(strcontent2);
      await CommonFunc.sleep(1000);
      console.info('SUB_ACE_ARKUI_GetSizeLimitationComponentSnapshot_0100 component obj is: ' + obj);
      console.info('SUB_ACE_ARKUI_GetSizeLimitationComponentSnapshot_0100 component obj2 is: ' + obj2);
      expect(parseInt(obj.$attrs.content)).assertLarger(0);
      expect(parseInt(obj2.$attrs.content)).assertLarger(0);
      console.info('SUB_ACE_ARKUI_GetSizeLimitationComponentSnapshot_0100 END')
      done();
    });
  })
}