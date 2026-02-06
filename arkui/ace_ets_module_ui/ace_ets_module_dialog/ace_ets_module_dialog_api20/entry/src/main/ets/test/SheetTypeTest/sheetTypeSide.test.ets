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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from '@ohos/hypium'
import router from '@ohos.router';
import { Driver, ON} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function SheetTypeTest() {
  describe('SheetTypeTest', () => {
    beforeEach(async (done: Function) => {
      console.info('SheetTypeTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/SheetType/sheetTypeSide',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get SheetTypeTest state pages: ' + JSON.stringify(pages));
        if (!('SheetTypeTest' == pages.name)) {
          console.info('get SheetTypeTest pages.name: ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(5000);
          console.info("push SheetTypeTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push SheetTypeTest page error: ' + err);
      }
      done()
    });

     /**
      * @tc.name   SheetTypeTest_001
      * @tc.number SheetTypeTest_001
      * @tc.desc   Test the SheetTypeTest not null
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL1
      */
     it('SheetTypeTest_001', TestType.Function | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('SheetTypeTest_001 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('sheetSide1'));
      await button.click();
      await CommonFunc.sleep(1000);

      let col = await driver.findComponent(ON.id('col'))
      let height = await  col.getBoundsCenter()

      let strJson1 : string = getInspectorByKey('DismissReason');
      let btn4 = await driver.findComponent(ON.id('side'))
      let rect = await btn4.getBounds()
      console.info(`rect is: ` + JSON.stringify(rect))

      if(JSON.parse(strJson1).$attrs.content){
        expect(rect.left - height.y > 0 ).assertTrue();
      }else{
        expect(JSON.parse(strJson1).$attrs.content).assertEqual('');
        console.info('SheetTypeTest_001 ERR');
      }
      await CommonFunc.sleep(1000);
      console.info('SheetTypeTest_001 END');
      done();
    });
  })
}