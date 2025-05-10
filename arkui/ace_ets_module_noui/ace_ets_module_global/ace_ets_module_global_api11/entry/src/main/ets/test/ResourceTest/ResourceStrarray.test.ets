/**
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import router from '@ohos.router';
import {
  UiComponent,
  Driver,
  Component,
  UiWindow,
  ON,
  BY,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/utils/Common';
import { MessageManager, Callback } from '../../MainAbility/utils/MessageManager';


export default function ResourceStrarray() {
  describe('ResourceStrarray', () => {
    beforeEach(async (done: Function) => {
      console.info("ResourceStrarray beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Resource/ResourceStrarray',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ResourceStrarray state pages: " + JSON.stringify(pages));
        if (!("ResourceStrarray" == pages.name)) {
          console.info("get ResourceStrarray state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push ResourceStrarray success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ResourceStrarray page error: " + err);
        expect().assertFail();
      }
      done();
    });

    it('ResourceStrarray_0100', 0, async (done: Function) => {
      console.info('ResourceStrarray_0100 START');
      try {
        let strJson = getInspectorByKey('strarray');
        console.info("push ResourceStrarray_0100 success: " + strJson);
      } catch (err) {
        console.error("push ResourceStrarray_0100 error: " + err);
      }
      let strJson = getInspectorByKey('strarray');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ResourceStrarray_0100] component obj is: " + JSON.stringify(obj));
      console.info("[ResourceStrarray_0100] title: " + JSON.stringify(obj.$attrs.range));
      expect(obj.$attrs.range).assertEqual('[\"icon:,text:11\",\"icon:,text:22\"]');
      console.info('[ResourceStrarray_0100] END');
      done();
    });

    it('ResourceStrarray_0200', 0, async (done: Function) => {
      console.info('ResourceStrarray_0200 START');
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('ResourceStrarray'));
      await button.click();
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('strarray');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ResourceStrarray_0200] component obj is: " + JSON.stringify(obj));
      console.info("[ResourceStrarray_0200] title: " + JSON.stringify(obj.$attrs.range));
      expect(obj.$attrs.range).assertEqual('[\"icon:,text:111\",\"icon:,text:222\"]');
      console.info('[ResourceStrarray_0200] END');
      done();
    });


  })
}

