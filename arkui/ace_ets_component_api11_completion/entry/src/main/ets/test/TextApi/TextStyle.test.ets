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

import router from '@ohos.router';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import Utils from '../Utils'
import { Driver, ON } from '@ohos.UiTest';

export default function TextStyle() {
  describe('TextStyle', () => {
    beforeEach(async (done: Function) => {
      console.info("TextStyle beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TextApi/TextStyle',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get TextStyle state pages:" + JSON.stringify(pages));
        if (!("TextStyle" == pages.name)) {
          console.info("get TextStyle pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push TextStyle page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TextStyle page error:" + err);
      }
      console.info("TextStyle beforeEach end");
      done();
    });
    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("TextStyle after each called");
    });


    /**
     * @tc.number TextStyle_0001
     * @tc.name TextStyle_0001
     * @tc.desc set api
     * @tc.level Level 1
     * @tc.type
     * @tc.size
     */
    it('TextStyle_0001', 0, async (done: Function) => {

      console.info('[TextStyle_0001] START');
      await Utils.sleep(2000);
      let text1 = getInspectorByKey('buttonStyle');
      expect(JSON.parse(text1).$attrs.buttonStyle).assertEqual('ButtonStyleMode.EMPHASIZED');

      console.info('[TextStyle_0001] END');
      done();
    });

    /**
     * @tc.number TextStyle_0002
     * @tc.name TextStyle_0002
     * @tc.desc set api
     * @tc.level Level 1
     * @tc.type
     * @tc.size
     */
    it('TextStyle_0002', 0, async (done: Function) => {

      console.info('[TextStyle_0002] START');
      await Utils.sleep(2000);
      let text1 = getInspectorByKey('searchEMAIL66666666');
      let Obj1 = JSON.parse(text1);
      expect(Obj1.$attrs.type).assertEqual('SearchType.EMAIL');

      console.info('[TextStyle_0002] END');
      done();
    });

    /**
     * @tc.number TextStyle_0003
     * @tc.name TextStyle_0003
     * @tc.desc set api
     * @tc.level Level 1
     * @tc.type
     * @tc.size
     */
    it('TextStyle_0003', 0, async (done: Function) => {

      console.info('[TextStyle_0003] START');
      await Utils.sleep(2000);
      let text1 = getInspectorByKey('TextAreaTypeEMAIL333333333');
      let Obj1 = JSON.parse(text1);
      expect(Obj1.$attrs.type).assertEqual('TextAreaType.EMAIL');

      console.info('[TextStyle_0003] END');
      done();
    });


    /**
     * @tc.number TextStyle_0004
     * @tc.name TextStyle_0004
     * @tc.desc set api
     * @tc.level Level 1
     * @tc.type
     * @tc.size
     */
    it('TextStyle_0004', 0, async (done: Function) => {

      console.info('[TextStyle_0004] START');
      await Utils.sleep(2000);
      let text1 = getInspectorByKey('TextAreaTypeNUMBER44444444');
      let Obj1 = JSON.parse(text1);
      expect(Obj1.$attrs.type).assertEqual('TextAreaType.PHONE_NUMBER');

      console.info('[TextStyle_0004] END');
      done();
    });


    /**
     * @tc.number TextStyle_0005
     * @tc.name TextStyle_0005
     * @tc.desc set api
     * @tc.level Level 1
     * @tc.type
     * @tc.size
     */
    it('TextStyle_0005', 0, async (done: Function) => {

      console.info('[TextStyle_0005] START');
      await Utils.sleep(2000);
      let text1 = getInspectorByKey('TextKeyAllNUMBER8898888888');
      let Obj1 = JSON.parse(text1);
      expect(Obj1.$attrs.ellipsisMode).assertEqual('EllipsisMode.START');

      console.info('[TextStyle_0005] END');
      done();
    });


    /**
     * @tc.number TextStyle_0006
     * @tc.name TextStyle_0006
     * @tc.desc set api
     * @tc.level Level 1
     * @tc.type
     * @tc.size
     */
    it('TextStyle_0006', 0, async (done: Function) => {

      console.info('[TextStyle_0006] START');
      await Utils.sleep(2000);
      let text1 = getInspectorByKey('searchType777777');
      let Obj1 = JSON.parse(text1);
      expect(Obj1.$attrs.type).assertEqual('SearchType.PHONE_NUMBER');

      console.info('[TextStyle_0006] END');
      done();
    });


    /**
     * @tc.number TextStyle_0007
     * @tc.name TextStyle_0007
     * @tc.desc set api
     * @tc.level Level 1
     * @tc.type
     * @tc.size
     */
    it('TextStyle_0007', 0, async (done: Function) => {

      console.info('[TextStyle_0007] START');
      await Utils.sleep(2000);
      let text1 = getInspectorByKey('searchEMAIL66666666');
      let Obj1 = JSON.parse(text1);
      expect(Obj1.$attrs.type).assertEqual('SearchType.EMAIL');

      console.info('[TextStyle_0007] END');
      done();
    });


    /**
     * @tc.number TextStyle_0008
     * @tc.name TextStyle_0008
     * @tc.desc set api
     * @tc.level Level 1
     * @tc.type
     * @tc.size
     */
    it('TextStyle_0008', 0, async (done: Function) => {
      console.info('[TextStyle_0008] START');
      let driver = Driver.create();
      await Utils.sleep(1000);
      let btn = await driver.findComponent(ON.id('buttonSelect'));
      await btn.click()
      await Utils.sleep(4000);
      let text1 = getInspectorByKey('selectionStart');
      expect(JSON.parse(text1).$attrs.content).assertEqual('10');
      let text2 = getInspectorByKey('selectionEnd');
      expect(JSON.parse(text2).$attrs.content).assertEqual('30');
      console.info('[TextStyle_0008] END');
      done();
    });

  })
}
