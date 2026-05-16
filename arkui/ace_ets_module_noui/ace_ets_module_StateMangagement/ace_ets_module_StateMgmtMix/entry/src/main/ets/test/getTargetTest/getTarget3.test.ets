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
import {UiComponent, Driver, Component, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function getTarget3Test() {
  describe('getTarget3Test', () => {
    beforeEach(async (done: Function) => {
      console.info("getTarget3Test beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/getTarget/getTarget3',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get getTarget3Test state pages: " + JSON.stringify(pages));
        if (!("getTarget3" == pages.name)) {
          console.info("get getTarget3Test state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push getTarget3Test success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push getTarget3Test page error: " + err);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   getTarget3Test_0100
     * @tc.number getTarget3
     * @tc.desc   api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getTarget3Test_0100', Level.LEVEL1, async (done: Function) => {
      console.info('getTarget3Test_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('useGetTarget3_1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[getTarget3Test_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('this.observedObject === globalObservedObject true');

      strJson = getInspectorByKey('useGetTarget3_2');
      obj = JSON.parse(strJson);
      console.info("[getTarget3Test_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('UIUtils.getTarget(this.numberList) === globalNumberList: true');

      strJson = getInspectorByKey('useGetTarget3_3');
      obj = JSON.parse(strJson);
      console.info("[getTarget3Test_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('UIUtils.getTarget(this.sampleMap) === globalSampleMAP: true');

      strJson = getInspectorByKey('useGetTarget3_4');
      obj = JSON.parse(strJson);
      console.info("[getTarget3Test_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('UIUtils.getTarget(this.sampleSet) === globalSampleSet: true');

      strJson = getInspectorByKey('useGetTarget3_5');
      obj = JSON.parse(strJson);
      console.info("[getTarget3Test_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('UIUtils.getTarget(this.sampleDate) === globalSampleDate: true');

      console.info('[getTarget3Test_0100] END');
      done();
    });
  })
}

