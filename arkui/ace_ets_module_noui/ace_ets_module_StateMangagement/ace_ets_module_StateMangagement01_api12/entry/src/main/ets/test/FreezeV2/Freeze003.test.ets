/**
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import {
  UiComponent,
  Driver,
  Component,
  UiWindow,
  UIElementInfo,
  ON,
  BY,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';


export default function FreezeV2Child() {
  describe('FreezeV2Child', () => {
    beforeEach(async (done: Function) => {
      console.info("FreezeV2Child beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/FreezeV2/Freeze003',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get FreezeV2Child state pages: " + JSON.stringify(pages));
        if (!("Freeze003" == pages.name)) {
          console.info("get FreezeV2Child state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push FreezeV2Child success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push FreezeV2Child page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   FreezeV2Child_01
     * @tc.number FreezeV2Child_01
     * @tc.desc   api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('FreezeV2Child_01', Level.LEVEL0, async (done: Function) => {
      await CommonFunc.sleep(1000)
      console.info('FreezeV2Child_01 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000)
      
      let nextPage = await driver.findComponent(ON.id('FreezeV2ChildNextPage'));
      await CommonFunc.sleep(1000)
      await nextPage.click();
      let backPage = await driver.findComponent(ON.id('FreezeV2ChildBackPage'));
      await CommonFunc.sleep(1000)
      await backPage.click();
      await CommonFunc.sleep(500)

      let observer1 = await driver.createUIEventObserver()
      let callback1 = (UiElementInfo: UIElementInfo) => {
        try {
          expect(UiElementInfo.text == 'The book name change from A Midsummer Night’s Dream to Jane Austen oPride and Prejudice').assertTrue();
          expect(UiElementInfo.type == 'Toast').assertTrue();
        } catch (err) {
          console.info(err);
        }
      }
      observer1.once('toastShow', callback1)
      await CommonFunc.sleep(3000)
      console.info('FreezeV2Child_01 END');
      done()
    })
  })
}

