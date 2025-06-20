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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level  } from "@ohos/hypium"
import router from '@ohos.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/utils/Common';
import GlobalContext from '../../MainAbility/common/GlobalContext'
import {MessageManager,Callback} from '../../MainAbility/utils/MessageManager';


export default function GridColOffsetJsunit() {
  describe('GridColOffsetJsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("GridColOffsetJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Grid/GridColoffsetPage',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get GridColOffsetJsunit state pages: " + JSON.stringify(pages));
        if (!("GridColoffsetPage" == pages.name)) {
          console.info("get GridColOffsetJsunit state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push GridColOffsetJsunit success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push GridColOffsetJsunit page error: " + err);
        expect().assertFail();
      }
      done();
    });

    it('GridColOffsetJsunit_0100',  Level.LEVEL0, async (done: Function) => {
      // Get the information of the GridCol component
      let strJson = getInspectorByKey('keykey2');
      let obj: ESObject = JSON.parse(strJson);
      expect(obj.$type).assertEqual('GridCol');
      console.info("[GridColOffsetJsunit_0100] component  strJson:" + JSON.stringify(obj.$attrs.gridColOffset));
      expect(obj.$attrs.gridColOffset).assertEqual("0");
      done();
    });

    it('GridColOffsetJsunit_0200',  Level.LEVEL0, async (done: Function) => {
      // Modify the properties of component GridCol
      console.info('[GridColOffsetJsunit_0200] START');
      await CommonFunc.sleep(200);
      GlobalContext.getContext().getObject<number>('value').message.notify({name:'gridColoffset',value:2});
      await CommonFunc.sleep(200);
      let strJson = getInspectorByKey('keykey2');
      let obj: ESObject = JSON.parse(strJson);
      expect(obj.$type).assertEqual('GridCol');
      console.info("[GridColOffsetJsunit_0100] component  strJson:" + JSON.stringify(obj.$attrs.gridColOffset));
      expect(obj.$attrs.gridColOffset).assertEqual("2");
      done();
    });

  })
}
