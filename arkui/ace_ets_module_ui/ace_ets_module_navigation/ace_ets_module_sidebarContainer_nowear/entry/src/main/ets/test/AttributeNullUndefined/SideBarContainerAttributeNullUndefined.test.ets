/**
 * Copyright (c) 2026 iSoftStone Information Technology (Group) Co.,Ltd.
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
import CommonFunc from '../../MainAbility/common/Common';
import { Driver, } from '@ohos.UiTest';

export default function SideBarContainerAttributeNullUndefined() {
  describe('SideBarContainerAttributeNullUndefined', () => {
    beforeEach(async (done: Function) => {
      console.info("SideBarContainerAttributeNullUndefined beforeEach start");
        let driver: Driver = Driver.create();
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/AttributeNullUndefined/SideBarContainerAttributeNullUndefined',
      };
      try {
        router.clear();
        let pages = router.getState();
        console.info("get SideBarContainerAttributeNullUndefined state pages:" + JSON.stringify(pages));
        if (!("SideBarContainerAttributeNullUndefined" == pages.name)) {
          console.info("get SideBarContainerAttributeNullUndefined pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push SideBarContainerAttributeNullUndefined page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push SideBarContainerAttributeNullUndefined page error:" + err);
      }
      console.info("SideBarContainerAttributeNullUndefined beforeEach end");
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("SideBarContainerAttributeNullUndefined after each called");
    });

    /**
    * @tc.name   SideBarContainerAttributeNullUndefined_0010
    * @tc.number SideBarContainerAttributeNullUndefined_0010
    * @tc.desc   test showSideBar false
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL1
    */
    it('SideBarContainerAttributeNullUndefined_0010', Level.LEVEL1, async (done: Function) => {
      let testName: string = '[SideBarContainerAttributeNullUndefined_0010]';
      console.log(`${testName} start`);
      let driver: Driver = Driver.create();

      let strJson1 = getInspectorByKey('sidebar1');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info(`${testName} 1 showSideBar: ` + obj1.$attrs.showSideBar);

      expect(obj1.$attrs.showSideBar == 'false').assertTrue();
      console.log(`${testName} end`);
      done();
    });

    /**
    * @tc.name   SideBarContainerAttributeNullUndefined_0020
    * @tc.number SideBarContainerAttributeNullUndefined_0020
    * @tc.desc   test sideBarWidth
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL1
    */
    it('SideBarContainerAttributeNullUndefined_0020', Level.LEVEL1, async (done: Function) => {
      let testName: string = '[SideBarContainerAttributeNullUndefined_0020]';
      console.log(`${testName} start`);
      let driver: Driver = Driver.create();

      let strJson3 = getInspectorByKey('sidebar3');
      let obj3: ESObject = JSON.parse(strJson3);
      console.info(`${testName} 3 sideBarWidth: ` + obj3.$attrs.sideBarWidth);

      let strJson1 = getInspectorByKey('sidebar1');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info(`${testName} 1 sideBarWidth: ` + obj1.$attrs.sideBarWidth);

      let strJson2 = getInspectorByKey('sidebar2');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info(`${testName} 2 sideBarWidth: ` + obj2.$attrs.sideBarWidth);

      expect(obj3.$attrs.sideBarWidth).assertEqual(obj2.$attrs.sideBarWidth);
      expect(obj3.$attrs.sideBarWidth).assertEqual(obj1.$attrs.sideBarWidth);
      console.log(`${testName} end`);
      done();
    });

    /**
    * @tc.name   SideBarContainerAttributeNullUndefined_0030
    * @tc.number SideBarContainerAttributeNullUndefined_0030
    * @tc.desc   test minSideBarWidth
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL1
    */
    it('SideBarContainerAttributeNullUndefined_0030', Level.LEVEL1, async (done: Function) => {
      let testName: string = '[SideBarContainerAttributeNullUndefined_0030]';
      console.log(`${testName} start`);
      let driver: Driver = Driver.create();

      let strJson3 = getInspectorByKey('sidebar3');
      let obj3: ESObject = JSON.parse(strJson3);
      console.info(`${testName} 3 minSideBarWidth: ` + obj3.$attrs.minSideBarWidth);

      let strJson1 = getInspectorByKey('sidebar1');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info(`${testName} 1 minSideBarWidth: ` + obj1.$attrs.minSideBarWidth);

      let strJson2 = getInspectorByKey('sidebar2');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info(`${testName} 2 minSideBarWidth: ` + obj2.$attrs.minSideBarWidth);

      expect(obj3.$attrs.minSideBarWidth).assertEqual(obj2.$attrs.minSideBarWidth);
      expect(obj3.$attrs.minSideBarWidth).assertEqual(obj1.$attrs.minSideBarWidth);
      console.log(`${testName} end`);
      done();
    });

    /**
    * @tc.name   SideBarContainerAttributeNullUndefined_0040
    * @tc.number SideBarContainerAttributeNullUndefined_0040
    * @tc.desc   test maxSideBarWidth
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL1
    */
    it('SideBarContainerAttributeNullUndefined_0040', Level.LEVEL1, async (done: Function) => {
      let testName: string = '[SideBarContainerAttributeNullUndefined_0040]';
      console.log(`${testName} start`);
      let driver: Driver = Driver.create();

      let strJson3 = getInspectorByKey('sidebar3');
      let obj3: ESObject = JSON.parse(strJson3);
      console.info(`${testName} 3 maxSideBarWidth: ` + obj3.$attrs.maxSideBarWidth);

      let strJson1 = getInspectorByKey('sidebar1');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info(`${testName} 1 maxSideBarWidth: ` + obj1.$attrs.maxSideBarWidth);

      let strJson2 = getInspectorByKey('sidebar2');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info(`${testName} 2 maxSideBarWidth: ` + obj2.$attrs.maxSideBarWidth);

      expect(obj3.$attrs.maxSideBarWidth).assertEqual(obj2.$attrs.maxSideBarWidth);
      expect(obj3.$attrs.maxSideBarWidth).assertEqual(obj1.$attrs.maxSideBarWidth);
      console.log(`${testName} end`);
      done();
    });

    /**
    * @tc.name   SideBarContainerAttributeNullUndefined_0050
    * @tc.number SideBarContainerAttributeNullUndefined_0050
    * @tc.desc   test divider
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL1
    */
    it('SideBarContainerAttributeNullUndefined_0050', Level.LEVEL1, async (done: Function) => {
      let testName: string = '[SideBarContainerAttributeNullUndefined_0050]';
      console.log(`${testName} start`);
      let driver: Driver = Driver.create();

      let strJson3 = getInspectorByKey('sidebar3');
      let obj3: ESObject = JSON.parse(strJson3);
      console.info(`${testName} 3 divider: ` + JSON.stringify(obj3.$attrs.divider));

      let strJson1 = getInspectorByKey('sidebar1');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info(`${testName} 1 divider: ` + JSON.stringify(obj1.$attrs.divider));

      let strJson2 = getInspectorByKey('sidebar2');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info(`${testName} 2 divider: ` + JSON.stringify(obj2.$attrs.divider));

      expect(JSON.stringify(obj3.$attrs.divider)).assertEqual(JSON.stringify(obj2.$attrs.divider));
      expect(JSON.stringify(obj3.$attrs.divider)).assertEqual(JSON.stringify(obj1.$attrs.divider));
      console.log(`${testName} end`);
      done();
    });

    /**
    * @tc.name   SideBarContainerAttributeNullUndefined_0060
    * @tc.number SideBarContainerAttributeNullUndefined_0060
    * @tc.desc   test minContentWidth
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL1
    */
    it('SideBarContainerAttributeNullUndefined_0060', Level.LEVEL1, async (done: Function) => {
      let testName: string = '[SideBarContainerAttributeNullUndefined_0060]';
      console.log(`${testName} start`);
      let driver: Driver = Driver.create();

      let strJson3 = getInspectorByKey('sidebar3');
      let obj3: ESObject = JSON.parse(strJson3);
      console.info(`${testName} 3 minContentWidth: ` + obj3.$attrs.minContentWidth);

      let strJson1 = getInspectorByKey('sidebar1');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info(`${testName} 1 minContentWidth: ` + obj1.$attrs.minContentWidth);

      let strJson2 = getInspectorByKey('sidebar2');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info(`${testName} 2 minContentWidth: ` + obj2.$attrs.minContentWidth);

      expect(obj3.$attrs.minContentWidth).assertEqual(obj2.$attrs.minContentWidth);
      expect(obj3.$attrs.minContentWidth).assertEqual(obj1.$attrs.minContentWidth);
      console.log(`${testName} end`);
      done();
    });
  })

}