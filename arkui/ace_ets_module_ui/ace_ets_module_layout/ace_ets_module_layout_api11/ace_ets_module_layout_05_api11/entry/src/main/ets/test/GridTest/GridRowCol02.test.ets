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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level  } from "@ohos/hypium"
import router from '@ohos.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/utils/Common';
import GlobalContext from '../../MainAbility/common/GlobalContext'
import {MessageManager,Callback} from '../../MainAbility/utils/MessageManager';


export default function GridRowCol02() {
  describe('GridRowCol02', () => {
    beforeEach(async (done: Function) => {
      console.info("GridRowCol02 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Grid/GridRowCol02',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get GridRowCol02 state pages: " + JSON.stringify(pages));
        if (!("GridRowCol02" == pages.name)) {
          console.info("get GridRowCol02 state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push GridRowCol02 page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push GridRowCol02 page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   GridRowCol02_001
     * @tc.number SUB_ACE_FUNCTION_JICHU_SR000HQ76H_017
     * @tc.desc   set rowsTemplate to repeat(auto-fit,10%)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('GridRowCol02_001',  Level.LEVEL0, async (done: Function) => {

      console.info('[GridRowCol02_001] START');
      await CommonFunc.sleep(1000);
      GlobalContext.getContext().getObject<string>('value').message.notify({name:'rowsTemplate', value: 'repeat(auto-fit,10%)' });
      await CommonFunc.sleep(200);
      let strJson1 = getInspectorByKey('GridRowCol02');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info("[GridRowCol02_001] component obj is: " + JSON.stringify(obj1));
      await CommonFunc.sleep(1000);
      expect(obj1.$attrs.rowsTemplate).assertEqual('repeat(auto-fit,10%)');

      console.info('[GridRowCol02_001] END');
      done();
    });

    /**
     * @tc.name   GridRowCol02_002
     * @tc.number SUB_ACE_FUNCTION_JICHU_SR000HQ76H_027 016
     * @tc.desc   set rowsTemplate to repeat(auto-fit,10%)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('GridRowCol02_002',  Level.LEVEL0, async (done: Function) => {

      console.info('[GridRowCol02_002] START');
      await CommonFunc.sleep(1000);
      GlobalContext.getContext().getObject<string>('value').message.notify({name:'rowsTemplate', value: 'repeat(auto-fit,90px)' });
      await CommonFunc.sleep(200);
      let strJson1 = getInspectorByKey('GridRowCol02');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info("[GridRowCol02_002] component obj is: " + JSON.stringify(obj1));
      await CommonFunc.sleep(1000);
      expect(obj1.$attrs.rowsTemplate).assertEqual('repeat(auto-fit,90px)');

      console.info('[GridRowCol02_002] END');
      done();
    });

    /**
     * @tc.name   GridRowCol02_003
     * @tc.number SUB_ACE_FUNCTION_JICHU_SR000HQ76H_026
     * @tc.desc   set rowsTemplate to repeat(auto-fit,10%)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('GridRowCol02_003',  Level.LEVEL0, async (done: Function) => {

      console.info('[GridRowCol02_003] START');
      await CommonFunc.sleep(1000);
      GlobalContext.getContext().getObject<string>('value').message.notify({name:'rowsTemplate', value: 'repeat(auto-fit,-1)' });
      await CommonFunc.sleep(200);
      let strJson1 = getInspectorByKey('GridRowCol02');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info("[GridRowCol02_003] component obj is: " + JSON.stringify(obj1));
      await CommonFunc.sleep(1000);
      expect(obj1.$attrs.rowsTemplate).assertEqual('repeat(auto-fit,-1)');

      console.info('[GridRowCol02_003] END');
      done();
    });

    /**
     * @tc.name   GridRowCol02_004
     * @tc.number SUB_ACE_FUNCTION_JICHU_SR000HQ76H_025
     * @tc.desc   set rowsTemplate to repeat(auto-fit,10%)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('GridRowCol02_004',  Level.LEVEL0, async (done: Function) => {

      console.info('[GridRowCol02_004] START');
      await CommonFunc.sleep(1000);
      GlobalContext.getContext().getObject<string>('value').message.notify({name:'rowsTemplate', value: 'repeat(auto-fit,90px)' });
      await CommonFunc.sleep(1000);
      let Column02 = CommonFunc.getComponentRect('Column02');
      let GridRowCol02 = CommonFunc.getComponentRect('GridRowCol02');
      await CommonFunc.sleep(1000);
      expect(Math.abs(Math.round(GridRowCol02.top - Column02.top) - Math.round(vp2px(10))) <= 1).assertTrue();
      let strJson1 = getInspectorByKey('GridRowCol02');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info("[GridRowCol02_004] component obj is: " + JSON.stringify(obj1));
      await CommonFunc.sleep(1000);
      expect(obj1.$attrs.rowsTemplate).assertEqual('repeat(auto-fit,90px)');

      console.info('[GridRowCol02_004] END');
      done();
    });

    /**
     * @tc.name   GridRowCol02_005
     * @tc.number SUB_ACE_FUNCTION_JICHU_SR000HQ76H_024
     * @tc.desc   set rowsTemplate to repeat(auto-fit,10%)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('GridRowCol02_005',  Level.LEVEL0, async (done: Function) => {

      console.info('[GridRowCol02_005] START');
      await CommonFunc.sleep(1000);
      GlobalContext.getContext().getObject<string>('value').message.notify({name:'rowsTemplate', value: 'repeat(auto-fit,90px)' });
      await CommonFunc.sleep(1000);
      let GridRowCol02 = CommonFunc.getComponentRect('GridRowCol02');
      let Item00 = CommonFunc.getComponentRect('Item00');
      await CommonFunc.sleep(1000);
      expect(Math.abs(Math.round(Item00.top - GridRowCol02.top) - Math.round(vp2px(10))) <= 1).assertTrue();
      let strJson1 = getInspectorByKey('GridRowCol02');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info("[GridRowCol02_005] component obj is: " + JSON.stringify(obj1));
      await CommonFunc.sleep(1000);
      expect(obj1.$attrs.rowsTemplate).assertEqual('repeat(auto-fit,90px)');

      console.info('[GridRowCol02_005] END');
      done();
    });

    /**
     * @tc.name   GridRowCol02_006
     * @tc.number SUB_ACE_FUNCTION_JICHU_SR000HQ76H_019
     * @tc.desc   set rowsTemplate to repeat(auto-fit,10%)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('GridRowCol02_006',  Level.LEVEL0, async (done: Function) => {

      console.info('[GridRowCol02_006] START');
      await CommonFunc.sleep(1000);
      GlobalContext.getContext().getObject<string>('value').message.notify({name:'rowsTemplate', value: 'repeat(auto-fit,90px)' });
      await CommonFunc.sleep(1000);
      let Item00 = CommonFunc.getComponentRect('Item00');
      let Item03 = CommonFunc.getComponentRect('Item03');
      await CommonFunc.sleep(1000);
      expect(Math.abs(Math.abs(Item03.top - Item00.bottom) - vp2px(10)) <= 1).assertTrue();
      let strJson1 = getInspectorByKey('GridRowCol02');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info("[GridRowCol02_006] component obj is: " + JSON.stringify(obj1));
      await CommonFunc.sleep(1000);
      expect(obj1.$attrs.rowsTemplate).assertEqual('repeat(auto-fit,90px)');

      console.info('[GridRowCol02_006] END');
      done();
    });



  })
}
