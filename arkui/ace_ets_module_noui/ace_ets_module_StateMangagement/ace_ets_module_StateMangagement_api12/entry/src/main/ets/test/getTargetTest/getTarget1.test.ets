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
import {MessageManager,Callback} from '../../MainAbility/common/MessageManager';
export default function getTarget1Test() {
  describe('getTarget1Test', () => {
    beforeEach(async (done: Function) => {
      console.info("getTarget1Test beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/getTarget/getTarget1',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get getTarget1Test state pages: " + JSON.stringify(pages));
        if (!("getTarget1" == pages.name)) {
          console.info("get getTarget1Test state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push getTarget1Test success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push getTarget1Test page error: " + err);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.number    getTarget1
     * @tc.name      getTarget1Test_0100
     * @tc.desc      api
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('getTarget1Test_0100', Level.LEVEL0, async (done: Function) => {
      console.info('getTarget1Test_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
 
      let strJson = getInspectorByKey('useGetTarget1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[getTarget1Test_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('this.observedObject === observedClass: true');

      strJson = getInspectorByKey('useGetTarget2');
      obj = JSON.parse(strJson);
      console.info("[getTarget1Test_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('UIUtils.getTarget(this.nonObservedObject) === nonObservedClass: true');

      strJson = getInspectorByKey('useGetTarget3');
      obj = JSON.parse(strJson);
      console.info("[getTarget1Test_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('UIUtils.getTarget(this.numberList) === globalNumberList: true');

      strJson = getInspectorByKey('useGetTarget4');
      obj = JSON.parse(strJson);
      console.info("[getTarget1Test_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('UIUtils.getTarget(this.sampleMap) === globalSampleMap: true');

      strJson = getInspectorByKey('useGetTarget5');
      obj = JSON.parse(strJson);
      console.info("[getTarget1Test_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('UIUtils.getTarget(this.sampleSet) === globalSampleSet: true');

      strJson = getInspectorByKey('useGetTarget6');
      obj = JSON.parse(strJson);
      console.info("[getTarget1Test_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('UIUtils.getTarget(this.sampleDate) === globalSampleDate: true');

      strJson = getInspectorByKey('noUseGetTarget1');
      obj = JSON.parse(strJson);
      console.info("[getTarget1Test_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('UIUtils.getTarget(this.nonObservedObject) === nonObservedClass: false');

      strJson = getInspectorByKey('noUseGetTarget2');
      obj = JSON.parse(strJson);
      console.info("[getTarget1Test_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('UIUtils.getTarget(this.numberList) === globalNumberList: false');

      strJson = getInspectorByKey('noUseGetTarget3');
      obj = JSON.parse(strJson);
      console.info("[getTarget1Test_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('UIUtils.getTarget(this.sampleMap) === globalSampleMap: false');

      strJson = getInspectorByKey('noUseGetTarget4');
      obj = JSON.parse(strJson);
      console.info("[getTarget1Test_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('UIUtils.getTarget(this.sampleSet) === globalSampleSet: false');

      strJson = getInspectorByKey('noUseGetTarget5');
      obj = JSON.parse(strJson);
      console.info("[getTarget1Test_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('UIUtils.getTarget(this.sampleDate) === globalSampleDate: false');

      console.info('[getTarget1Test_0100] END');
      done();
    });
  })
}

