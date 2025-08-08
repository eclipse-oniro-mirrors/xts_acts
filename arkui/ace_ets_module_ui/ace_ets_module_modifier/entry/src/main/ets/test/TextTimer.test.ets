/**
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level} from '@ohos/hypium';
import router from '@ohos.router';
import Utils from './Utils';
import { UiDriver, UiComponent, BY, Driver, Component, ON } from '@ohos.UiTest'

export default function textTimer() {
  describe('textTimerTest', () => {
    beforeEach(async (done: Function) => {
      console.info("textTimerJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/textTimer',
      }

      try {
        router.clear();
        let pages = router.getState();
        console.info("get textTimer state pages: " + JSON.stringify(pages));
        if (!("textTimer" == pages.name)) {
          console.info("get textTimer state pages.name: " + JSON.stringify(pages.name));
          await router.pushUrl(options);
          await Utils.sleep(2000);
        }
      } catch (err) {
        console.error("push textTimer page error: " + err);
      }
      done();
    });

    /**
     * @tc.number textTimerJsunit_0100
     * @tc.name Test the properties of components
     * @tc.desc Set fontSize values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('textTimerJsunit_0100', Level.LEVEL0, async (done: Function) => {
      console.info('textTimerJsunit_0100 START');
      let strJson = getInspectorByKey('TextTimerKey1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[textTimerJsunit_0100] obj is: " + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.fontSize).assertEqual('20.00fp');
      console.info('textTimerJsunit_0100 END');
      done();
    });

    /**
     * @tc.number textTimerJsunit_0200
     * @tc.name Test the properties of components
     * @tc.desc Set fontColor values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('textTimerJsunit_0200', Level.LEVEL0, async (done: Function) => {
      console.info('textTimerJsunit_0200 START');
      let strJson = getInspectorByKey('TextTimerKey1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[textTimerJsunit_0200] obj is: " + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.fontColor).assertEqual('#FFFFC0CB');
      console.info('textTimerJsunit_0200 END');
      done();
    });

    /**
     * @tc.number textTimerJsunit_0300
     * @tc.name Test the properties of components
     * @tc.desc Set format values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('textTimerJsunit_0300', Level.LEVEL0, async (done: Function) => {
      console.info('textTimerJsunit_0300 START');
      let strJson = getInspectorByKey('TextTimerKey1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[textTimerJsunit_0300] obj is: " + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.format).assertEqual('mm:ss.SS');
      console.info('textTimerJsunit_0300 END');
      done();
    });

    /**
     * @tc.number textTimerJsunit_0400
     * @tc.name Test the properties of components
     * @tc.desc Set fontWeight values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('textTimerJsunit_0400', Level.LEVEL0, async (done: Function) => {
      console.info('textTimerJsunit_0400 START');
      let strJson = getInspectorByKey('TextTimerKey1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[textTimerJsunit_0400] obj is: " + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.fontWeight).assertEqual('FontWeight.Normal');
      console.info('textTimerJsunit_0400 END');
      done();
    });

    /**
     * @tc.number textTimerJsunit_0500
     * @tc.name Test the properties of components
     * @tc.desc Set fontStyle values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('textTimerJsunit_0500', Level.LEVEL0, async (done: Function) => {
      console.info('textTimerJsunit_0500 START');
      let strJson = getInspectorByKey('TextTimerKey1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[textTimerJsunit_0500] obj is: " + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.fontStyle).assertEqual('FontStyle.Italic');
      console.info('textTimerJsunit_0500 END');
      done();
    });

    /**
     * @tc.number textTimerJsunit_0600
     * @tc.name Test the properties of components
     * @tc.desc Set fontFamily values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('textTimerJsunit_0600', Level.LEVEL0, async (done: Function) => {
      console.info('textTimerJsunit_0600 START');
      let strJson = getInspectorByKey('TextTimerKey1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[textTimerJsunit_0600] obj is: " + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.fontFamily).assertEqual('cursive');
      console.info('textTimerJsunit_0600 END');
      done();
    });
    /**
     * @tc.number textTimerJsunit_0601
     * @tc.name Test the properties of components
     * @tc.desc Change fontSize values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('textTimerJsunit_0601', Level.LEVEL0, async (done: Function) => {
      console.info('textTimerJsunit_0601 START');
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('changeButton'));
      await button.click();
      await Utils.sleep(2000)
      let strJsonNew = getInspectorByKey('TextTimerKey1'); //测试组件的key名称
      let objNew: ESObject = JSON.parse(strJsonNew);
      console.info("textTimerJsunit_0601 component  is: " + JSON.stringify(objNew.$attrs));
      expect(objNew.$attrs.fontSize).assertEqual('5.00fp'); //
      console.info('textTimerJsunit_0601 END');
      done();
    });
  })
}
