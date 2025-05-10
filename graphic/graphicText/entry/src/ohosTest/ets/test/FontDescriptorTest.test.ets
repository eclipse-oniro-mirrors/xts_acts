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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from "@ohos/hypium"
import router from '@ohos.router';
import { Driver, ON, } from '@ohos.UiTest';
import CommonFunc from '../MainAbility/utils/Common';

export default function FontDescriptorTest() {
  describe('FontDescriptorTest', () => {
    beforeEach(async (done: Function) => {
      console.info("FontDescriptorTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/FontDescriptor',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get FontDescriptorTest state pages: " + JSON.stringify(pages));
        if (!("FontDescriptor" == pages.name)) {
          console.info("get FontDescriptorTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(1000);
          console.info("push FontDescriptorTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push FontDescriptorTest page error: " + err);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.number FontDescriptor
     * @tc.name FontDescriptorTest_0100
     * @tc.desc api
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('FontDescriptorTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('FontDescriptorTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('FontDescriptor_6'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson1 = getInspectorByKey('FontDescriptor_1');
      let strJson2 = getInspectorByKey('FontDescriptor_2');
      let strJson3 = getInspectorByKey('FontDescriptor_3');
      let strJson4 = getInspectorByKey('FontDescriptor_4');
      let strJson5 = getInspectorByKey('FontDescriptor_5');
      await CommonFunc.sleep(1000);
      let obj1: ESObject = JSON.parse(strJson1);
      let obj2: ESObject = JSON.parse(strJson2);
      let obj3: ESObject = JSON.parse(strJson3);
      let obj4: ESObject = JSON.parse(strJson4);
      let obj5: ESObject = JSON.parse(strJson5);
      await CommonFunc.sleep(1000);
      expect(obj1.$attrs.content).assertEqual('postScriptName:NotoSansMyanmar-Regular');
      expect(obj2.$attrs.content).assertEqual('fontFamily:Noto Sans Myanmar');
      expect(obj3.$attrs.content).assertEqual('italic:0');
      expect(obj4.$attrs.content).assertEqual('monoSpace:false');
      expect(obj5.$attrs.content).assertEqual('symbolic:false');
      console.info('[FontDescriptorTest_0100] END');
      await CommonFunc.sleep(1000);
      done();
    });
  })
}