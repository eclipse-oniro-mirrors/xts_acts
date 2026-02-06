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
import { describe, beforeEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { Driver, ON, Component} from '@ohos.UiTest';
import router from '@ohos.router';
import Utils from '../../MainAbility/common/Utils';
const SLEEP_TIME = 1000;

export default function showDefaultSelectedIconTest() {
  describe('showDefaultSelectedIconTest', () => {
    beforeEach(async (done: Function) => {
      console.info("showDefaultSelectedIcon beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/select/showDefaultSelectedIcon',
      }
      router.clear();
      let pages = router.getState();
      console.info("get showDefaultSelectedIconTest state pages: " + JSON.stringify(pages));
      if (!("showDefaultSelectedIcon" == pages.name)) {
        console.info("get showDefaultSelectedIconTest state pages.name: " + JSON.stringify(pages.name));
        let result = await router.push(options);
        console.info("push showDefaultSelectedIconTest success: " + JSON.stringify(result));
      }
      done();
    });

    /**
     * @tc.number: showDefaultSelectedIcon_value_0001
     * @tc.name  : showDefaultSelectedIcon_value_0001
     * @tc.desc  : set showDefaultSelectedIcon:false,levelUniqueId: Normal value
     * @tc.level : Level 3  
     * @tc.type
     * @tc.size
     */
    it('showDefaultSelectedIcon_value_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('showDefaultSelectedIcon_value_0001 START');
      let driver: Driver = Driver.create();
      let button = await driver.findComponent(ON.id('showDefaultSelectedIconButton'));
      await button.click();
      await Utils.sleep(SLEEP_TIME);
      let selectValue = getInspectorByKey('select');
      console.info('showDefaultSelectedIcon_value_0001' + JSON.stringify(JSON.parse(selectValue).$attrs.showDefaultSelectedIcon));
      expect(JSON.parse(selectValue).$attrs.showDefaultSelectedIcon).assertEqual('false'); 
      console.info('showDefaultSelectedIcon_value_0001 END');
      done();
    });

    /**
     * @tc.number: showDefaultSelectedIcon_value_0002
     * @tc.name  : showDefaultSelectedIcon_value_0002
     * @tc.desc  : set showDefaultSelectedIcon:true,levelUniqueId: Normal value
     * @tc.level : Level 3
     * @tc.type
     * @tc.size
     */
    it('showDefaultSelectedIcon_value_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('showDefaultSelectedIcon_value_0002 START');
      let driver: Driver = Driver.create();
      let button = await driver.findComponent(ON.id('showDefaultSelectedIconButton'));
      await button.click();
      await Utils.sleep(SLEEP_TIME);
      let selectValue = getInspectorByKey('select');
      console.info('showDefaultSelectedIcon_value_0002' + JSON.stringify(JSON.parse(selectValue).$attrs.showDefaultSelectedIcon));
      expect(JSON.parse(selectValue).$attrs.showDefaultSelectedIcon).assertEqual('true');
      console.info('showDefaultSelectedIcon_value_0002 END');
      done();
    });

    /**
     * @tc.number: showDefaultSelectedIcon_value_0003
     * @tc.name  : showDefaultSelectedIcon_value_0003
     * @tc.desc  : set showDefaultSelectedIcon:undefined,levelUniqueId: Abnormal value
     * @tc.level : Level 3
     * @tc.type
     * @tc.size
     */
    it('showDefaultSelectedIcon_value_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('showDefaultSelectedIcon_value_0003 START');
      let driver: Driver = Driver.create();
      let button = await driver.findComponent(ON.id('showDefaultSelectedIconButton'));
      await button.click();
      await Utils.sleep(SLEEP_TIME);
      let selectValue = getInspectorByKey('select');
      console.info('showDefaultSelectedIcon_value_0003' + JSON.stringify(JSON.parse(selectValue).$attrs.showDefaultSelectedIcon));
      expect(JSON.parse(selectValue).$attrs.showDefaultSelectedIcon).assertEqual('false');
      console.info('showDefaultSelectedIcon_value_0003 END');
      done();
    });

    /**
     * @tc.number: showDefaultSelectedIcon_value_0004
     * @tc.name  : showDefaultSelectedIcon_value_0004
     * @tc.desc  : set showDefaultSelectedIcon:undefined,levelUniqueId: Abnormal value
     * @tc.level : Level 3
     * @tc.type
     * @tc.size
     */
    it('showDefaultSelectedIcon_value_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('showDefaultSelectedIcon_value_0004 START');
      let driver: Driver = Driver.create();
      let button = await driver.findComponent(ON.id('showDefaultSelectedIconButton'));
      await button.click();
      await Utils.sleep(SLEEP_TIME);
      let selectValue = getInspectorByKey('select');
      console.info('showDefaultSelectedIcon_value_0004' + JSON.stringify(JSON.parse(selectValue).$attrs.showDefaultSelectedIcon));
      expect(JSON.parse(selectValue).$attrs.showDefaultSelectedIcon).assertEqual('false');
      console.info('showDefaultSelectedIcon_value_0004 END');
      done();
    });
  })
}