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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import router from '@ohos.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/utils/Common';
import GlobalContext from '../../MainAbility/common/GlobalContext'
import {MessageManager,Callback} from '../../MainAbility/utils/MessageManager';


export default function GridRowJsunit() {
  describe('GridRowJsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("GridRowJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Grid/GridRowPage',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get GridRowJsunit state pages: " + JSON.stringify(pages));
        if (!("GridRowPage" == pages.name)) {
          console.info("get GridRowJsunit state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push GridRowJsunit success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push GridRowJsunit page error: " + err);
        expect().assertFail();
      }
      done();
    });

    it('GridRowJsunit_0100', 0, async (done: Function) => {
      // Get the information of the GridRow component
      console.info('[GridRowJsunit_0100] START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('gridRow');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[GridRowJsunit_0100] component obj is: " + JSON.stringify(obj));
      console.info("[GridRowJsunit_0100] columns: " + JSON.stringify(obj.$attrs.columns));
      console.info("[GridRowJsunit_0100] breakpoints: " + JSON.stringify(obj.$attrs.breakpoints));
      console.info("[GridRowJsunit_0100] direction: " + JSON.stringify(obj.$attrs.direction));
      console.info("[GridRowJsunit_0100] gutter: " + JSON.stringify(obj.$attrs.gutter));
      expect(obj.$attrs.columns).assertEqual('4');
      expect(obj.$attrs.breakpoints).assertEqual('4');
      expect(obj.$attrs.direction).assertEqual('4');
      // fix the vp2px
      let x = vp2px(5).toFixed(6);
      let y = vp2px(10).toFixed(6);
      let str = '<' + x + ', '+y;
      expect(obj.$attrs.gutter).assertEqual(str);
      console.info('[GridRowJsunit_0100] END');
      done();
    });

    it('GridRowJsunit_0200', 0, async (done: Function) => {
      // Modify the properties of component GridRow
      console.info('[GridRowJsunit_0200] START');
      GlobalContext.getContext().getObject<string>('value').message.notify({name:'columns',value:'12'})
      await CommonFunc.sleep(2000);
      GlobalContext.getContext().getObject<string>('value').message.notify({name:'gutter',value:'x: 7.5, y: 15'})
      await CommonFunc.sleep(2000);
      GlobalContext.getContext().getObject<string>('value').message.notify({name:'breakpoints',value:'12'})
      await CommonFunc.sleep(2000);
      GlobalContext.getContext().getObject<string>('value').message.notify({name:'grDirection',value:'12'})
      await CommonFunc.sleep(2000);
      GlobalContext.getContext().getObject<string>('value').message.notify({name:'currentBp',value:'sm'})
      await CommonFunc.sleep(2000);

      // Get the propoties value of the GridRow component
      let strJson = getInspectorByKey('gridRow');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[GridRowJsunit_0200] component obj is: " + JSON.stringify(obj));
      console.info("[GridRowJsunit_0200] columns: " + JSON.stringify(obj.$attrs.columns));
      console.info("[GridRowJsunit_0200] breakpoints: " + JSON.stringify(obj.$attrs.breakpoints));
      console.info("[GridRowJsunit_0200] direction: " + JSON.stringify(obj.$attrs.direction));
      console.info("[GridRowJsunit_0200] gutter: " + JSON.stringify(obj.$attrs.gutter));
      expect(obj.$attrs.columns).assertEqual('12');
      expect(obj.$attrs.breakpoints).assertEqual('12');
      expect(obj.$attrs.direction).assertEqual('12');
      let x = vp2px(0).toFixed(6);
      let y = vp2px(0).toFixed(6);
      let str = '<' + x + ', '+y;
      expect(obj.$attrs.gutter).assertEqual(str);
      console.info('[GridRowJsunit_0200] END');
      done();
    });

    it('GridRowJsunit_0300', 0, async (done: Function) => {
      // Illegal modification of properties of component GridRow
      console.info('[GridRowJsunit_0300] START');
      GlobalContext.getContext().getObject<string>('value').message.notify({name:'gutter',value:'-10'})
      await CommonFunc.sleep(200);
      GlobalContext.getContext().getObject<string>('value').message.notify({name:'columns',value:'-5'})
      await CommonFunc.sleep(200);
      GlobalContext.getContext().getObject<string>('value').message.notify({name:'breakpoints',value:'test'})
      await CommonFunc.sleep(200);
      GlobalContext.getContext().getObject<string>('value').message.notify({name:'grDirection',value:'test'})
      await CommonFunc.sleep(200);
      GlobalContext.getContext().getObject<string>('value').message.notify({name:'currentBp',value:'110'})
      await CommonFunc.sleep(200);

      // Get the propoties value of the GridRow component
      let strJson = getInspectorByKey('gridRow');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[GridRowJsunit_0300] component obj is: " + JSON.stringify(obj));
      console.info("[GridRowJsunit_0300] columns: " + JSON.stringify(obj.$attrs.columns));
      console.info("[GridRowJsunit_0300] breakpoints: " + JSON.stringify(obj.$attrs.breakpoints));
      console.info("[GridRowJsunit_0300] direction: " + JSON.stringify(obj.$attrs.direction));
      console.info("[GridRowJsunit_0300] gutter: " + JSON.stringify(obj.$attrs.gutter));
      expect(obj.$attrs.columns).assertEqual('12');
      expect(obj.$attrs.breakpoints).assertEqual('12');
      expect(obj.$attrs.direction).assertEqual('12');
      let x = vp2px(-10).toFixed(6);
      let y = vp2px(-10).toFixed(6);
      let str = '<' + x + ', '+y;
      expect(obj.$attrs.gutter).assertEqual(str);
      console.info('[GridRowJsunit_0300] END');
      done();
    });

    it('GridRowJsunit_0400', 0, async (done: Function) => {
      // Verify default value of the GridRow component
      console.info('[GridRowJsunit_0400] START');
      let strJson = getInspectorByKey('gridRow_default');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[GridRowJsunit_0400] component obj is: " + JSON.stringify(obj));
      console.info("[GridRowJsunit_0400] columns: " + JSON.stringify(obj.$attrs.columns));
      console.info("[GridRowJsunit_0400] breakpoints: " + JSON.stringify(obj.$attrs.breakpoints));
      console.info("[GridRowJsunit_0400] direction: " + JSON.stringify(obj.$attrs.direction));
      console.info("[GridRowJsunit_0400] gutter: " + JSON.stringify(obj.$attrs.gutter));
      expect(obj.$attrs.columns).assertEqual('12');
      expect(obj.$attrs.gutter).assertEqual('<0.000000, 0.000000');
      expect(obj.$attrs.breakpoints).assertEqual('12');
      expect(obj.$attrs.direction).assertEqual('12');
      console.info('[GridRowJsunit_0400] END');
      done();
    });
  })
}
