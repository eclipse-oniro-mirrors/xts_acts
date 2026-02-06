/*
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

function sleep(time: number) {
  return new Promise<string>((resolve, reject) => {
    setTimeout(() => {
      resolve("ok")
    }, time)
  }).then(() => {
    console.info(`sleep ${time} over...`)
  })
}
export default function menuDividerTest() {
  describe('ActsMenuDividerTest', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Menu/menuDivider",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get menuDivider state success " + JSON.stringify(pages));
        if (!("menuDivider" == pages.name)) {
          console.info("get menuDivider state success " + JSON.stringify(pages.name));
          let result = await router.push(options)
          console.info("push menuDivider page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push menuDivider page error " + JSON.stringify(err));
      }
      await sleep(2000)
      done()
    });

    /**
     * @tc.number    ArkUX_Stage_Menu_menuItemDivider_0001
     * @tc.name      menuItemDivider test
     * @tc.desc      menuItemDivider test
     */

    it('ArkUX_Stage_Menu_menuItemDivider_0001', Level.LEVEL2, async (done: Function) => {
      console.info('[ArkUX_Stage_Menu_menuItemDivider_0001] START');

      let myJson = getInspectorByKey('menuItemDividerText');
      console.info(`[ArkUX_Stage_Menu_menuItemDivider_0001] component obj1 is:${JSON.stringify(myJson)}`);
      await sleep(200);
      let obj1: ESObject = JSON.parse(myJson);
      console.info(`[ArkUX_Stage_Menu_menuItemDivider_0001] component obj1 is:${JSON.stringify(obj1)}`);
      await sleep(1000);

      expect(obj1.$attrs.itemDivider.strokeWidth).assertEqual('1.50vp');
      console.info('[ArkUX_Stage_Menu_menuItemDivider_0001] END');
      done();
    });

    /**
     * @tc.number    ArkUX_Stage_Menu_menuItemDivider_0002
     * @tc.name      menuItemDivider test
     * @tc.desc      menuItemDivider test
     */

    it('ArkUX_Stage_Menu_menuItemDivider_0002', Level.LEVEL2, async (done: Function) => {
      console.info('[ArkUX_Stage_Menu_menuItemDivider_0200] START');

      let strJson = getInspectorByKey('menuItemDividerText');
      await sleep(200);
      let obj: ESObject = JSON.parse(strJson);
      console.info(`[ArkUX_Stage_Menu_menuItemDivider_0002] component obj is:${JSON.stringify(obj)}`);
      await sleep(1000);

      expect(obj.$attrs.itemDivider.color).assertEqual('#FFFFC0CB');
      console.info('[ArkUX_Stage_Menu_menuItemDivider_0002] END');
      done();
    });

    /**
     * @tc.number    ArkUX_Stage_Menu_menuItemDivider_0003
     * @tc.name      menuItemDivider test
     * @tc.desc      menuItemDivider test
     */

    it('ArkUX_Stage_Menu_menuItemDivider_0003', Level.LEVEL2, async (done: Function) => {
      console.info('[ArkUX_Stage_Menu_menuItemDivider_0003] START');

      let strJson = getInspectorByKey('menuItemDividerText');
      await sleep(200);
      let obj: ESObject = JSON.parse(strJson);
      console.info(`[ArkUX_Stage_Menu_menuItemDivider_0003] component obj is:${JSON.stringify(obj)}`);
      await sleep(1000);

      expect(obj.$attrs.itemDivider.startMargin).assertEqual('2.00vp');
      console.info('[ArkUX_Stage_Menu_menuItemDivider_0003] END');
      done();
    });

    /**
     * @tc.number    ArkUX_Stage_Menu_menuItemDivider_0004
     * @tc.name      menuItemDivider test
     * @tc.desc      menuItemDivider test
     */
    it('ArkUX_Stage_Menu_menuItemDivider_0004', Level.LEVEL2, async (done: Function) => {
      console.info('[ArkUX_Stage_Menu_menuItemDivider_0004] START');

      let strJson = getInspectorByKey('menuItemDividerText');
      await sleep(200);
      let obj: ESObject = JSON.parse(strJson);
      console.info(`[ArkUX_Stage_Menu_menuItemDivider_0004] component obj is:${JSON.stringify(obj)}`);
      await sleep(1000);

      expect(obj.$attrs.itemDivider.endMargin).assertEqual('2.00vp');
      console.info('[ArkUX_Stage_Menu_menuItemDivider_0004] END');
      done();
    });

    /**
     * @tc.number    ArkUX_Stage_Menu_menuItemDivider_0005
     * @tc.name      menuItemDivider test
     * @tc.desc      menuItemDivider test
     */

    it('ArkUX_Stage_Menu_menuItemDivider_0005', Level.LEVEL2, async (done: Function) => {
      console.info('[ArkUX_Stage_Menu_menuItemDivider_0005] START');

      let myJson = getInspectorByKey('menuItemDividerText1');
      console.info(`[ArkUX_Stage_Menu_menuItemDivider_0005] component obj1 is:${JSON.stringify(myJson)}`);
      await sleep(200);
      let obj1: ESObject = JSON.parse(myJson);
      console.info(`[ArkUX_Stage_Menu_menuItemDivider_0005] component obj1 is:${JSON.stringify(obj1)}`);
      await sleep(1000);

      expect(obj1.$attrs.itemDivider.strokeWidth).assertEqual('0.00px');
      console.info('[ArkUX_Stage_Menu_menuItemDivider_0005] END');
      done();
    });

    /**
     * @tc.number    ArkUX_Stage_Menu_menuItemDivider_0006
     * @tc.name      menuItemDivider test
     * @tc.desc      menuItemDivider test
     */

    it('ArkUX_Stage_Menu_menuItemDivider_0006', Level.LEVEL2, async (done: Function) => {
      console.info('[ArkUX_Stage_Menu_menuItemDivider_0006] START');

      let strJson = getInspectorByKey('menuItemDividerText1');
      await sleep(200);
      let obj: ESObject = JSON.parse(strJson);
      console.info(`[ArkUX_Stage_Menu_menuItemDivider_0006] component obj is:${JSON.stringify(obj)}`);
      await sleep(1000);

      expect(obj.$attrs.itemDivider.color).assertEqual('#00000000');
      console.info('[ArkUX_Stage_Menu_menuItemDivider_0006] END');
      done();
    });

    /**
     * @tc.number    ArkUX_Stage_Menu_menuItemDivider_0007
     * @tc.name      menuItemDivider test
     * @tc.desc      menuItemDivider test
     */

    it('ArkUX_Stage_Menu_menuItemDivider_0007', Level.LEVEL2, async (done: Function) => {
      console.info('[ArkUX_Stage_Menu_menuItemDivider_0007] START');

      let strJson = getInspectorByKey('menuItemDividerText1');
      await sleep(200);
      let obj: ESObject = JSON.parse(strJson);
      console.info(`[ArkUX_Stage_Menu_menuItemDivider_0007] component obj is:${JSON.stringify(obj)}`);
      await sleep(1000);

      expect(obj.$attrs.itemDivider.startMargin).assertEqual('0.00px');
      console.info('[ArkUX_Stage_Menu_menuItemDivider_0007] END');
      done();
    });

    /**
     * @tc.number    ArkUX_Stage_Menu_menuItemDivider_0008
     * @tc.name      menuItemDivider test
     * @tc.desc      menuItemDivider test
     */
    it('ArkUX_Stage_Menu_menuItemDivider_0008', Level.LEVEL2, async (done: Function) => {
      console.info('[ArkUX_Stage_Menu_menuItemDivider_0012] START');

      let strJson = getInspectorByKey('menuItemDividerText2');
      await sleep(200);
      let obj: ESObject = JSON.parse(strJson);
      console.info(`[ArkUX_Stage_Menu_menuItemDivider_0008] component obj is:${JSON.stringify(obj)}`);
      await sleep(1000);

      expect(obj.$attrs.itemDivider.endMargin).assertEqual('0.00px');
      console.info('[ArkUX_Stage_Menu_menuItemDivider_0008] END');
      done();
    });

    /**
     * @tc.number    ArkUX_Stage_Menu_menuItemDivider_0009
     * @tc.name      menuItemDivider test
     * @tc.desc      menuItemDivider test
     */

    it('ArkUX_Stage_Menu_menuItemDivider_0009', Level.LEVEL2, async (done: Function) => {
      console.info('[menuItemDivider_0100] START');

      let myJson = getInspectorByKey('menuItemDividerText1');
      console.info(`[ArkUX_Stage_Menu_menuItemDivider_0005] component obj1 is:${JSON.stringify(myJson)}`);
      await sleep(200);
      let obj1: ESObject = JSON.parse(myJson);
      console.info(`[ArkUX_Stage_Menu_menuItemDivider_0009] component obj1 is:${JSON.stringify(obj1)}`);
      await sleep(1000);

      expect(obj1.$attrs.itemDivider.strokeWidth).assertEqual('0.00px');
      console.info('[ArkUX_Stage_Menu_menuItemDivider_0009] END');
      done();
    });

    /**
     * @tc.number    ArkUX_Stage_Menu_menuItemDivider_0010
     * @tc.name      menuItemDivider test
     * @tc.desc      menuItemDivider test
     */

    it('ArkUX_Stage_Menu_menuItemDivider_0010', Level.LEVEL2, async (done: Function) => {
      console.info('[ArkUX_Stage_Menu_menuItemDivider_0010] START');

      let strJson = getInspectorByKey('menuItemDividerText2');
      await sleep(200);
      let obj: ESObject = JSON.parse(strJson);
      console.info(`[ArkUX_Stage_Menu_menuItemDivider_0010] component obj is:${JSON.stringify(obj)}`);
      await sleep(1000);

      expect(obj.$attrs.itemDivider.color).assertEqual('#00000000');
      console.info('[ArkUX_Stage_Menu_menuItemDivider_0010] END');
      done();
    });

    /**
     * @tc.number    ArkUX_Stage_Menu_menuItemDivider_0011
     * @tc.name      menuItemDivider test
     * @tc.desc      menuItemDivider test
     */

    it('ArkUX_Stage_Menu_menuItemDivider_0011', Level.LEVEL2, async (done: Function) => {
      console.info('[ArkUX_Stage_Menu_menuItemDivider_0011] START');

      let strJson = getInspectorByKey('menuItemDividerText2');
      await sleep(200);
      let obj: ESObject = JSON.parse(strJson);
      console.info(`[ArkUX_Stage_Menu_menuItemDivider_0011] component obj is:${JSON.stringify(obj)}`);
      await sleep(1000);

      expect(obj.$attrs.itemDivider.startMargin).assertEqual('0.00px');
      console.info('[ArkUX_Stage_Menu_menuItemDivider_0011] END');
      done();
    });

    /**
     * @tc.number    ArkUX_Stage_Menu_menuItemDivider_0012
     * @tc.name      menuItemDivider test
     * @tc.desc      menuItemDivider test
     */
    it('ArkUX_Stage_Menu_menuItemDivider_0012', Level.LEVEL2, async (done: Function) => {
      console.info('[ArkUX_Stage_Menu_menuItemDivider_0012] START');

      let strJson = getInspectorByKey('menuItemDividerText2');
      await sleep(200);
      let obj: ESObject = JSON.parse(strJson);
      console.info(`[ArkUX_Stage_Menu_menuItemDivider_0012] component obj is:${JSON.stringify(obj)}`);
      await sleep(1000);

      expect(obj.$attrs.itemDivider.endMargin).assertEqual('0.00px');
      console.info('[ArkUX_Stage_Menu_menuItemDivider_0012] END');
      done();
    });

    /**
     * @tc.number    ArkUX_Stage_Menu_menuItemDivider_0013
     * @tc.name      menuItemDivider test
     * @tc.desc      menuItemDivider test
     */

      it('ArkUX_Stage_Menu_menuItemDivider_0013', Level.LEVEL2, async (done: Function) => {
        console.info('[ArkUX_Stage_Menu_menuItemDivider_0013] START');
  
        let strJson = getInspectorByKey('menuItemDividerText3');
        await sleep(200);
        let obj: ESObject = JSON.parse(strJson);
        console.info(`[ArkUX_Stage_Menu_menuItemDivider_0013] component obj is:${JSON.stringify(obj)}`);
        await sleep(1000);
  
        expect(obj.$attrs.itemDivider.color).assertEqual('#FF000000');
        console.info('[ArkUX_Stage_Menu_menuItemDivider_0013] END');
        done();
      });

    /**
     * @tc.number    ArkUX_Stage_Menu_menuItemGroupDivider_001
     * @tc.name      menuItemGroupDivider test
     * @tc.desc      menuItemGroupDivider test
     */

    it('ArkUX_Stage_Menu_menuItemGroupDivider_001', Level.LEVEL2, async (done: Function) => {
      console.info('[ArkUX_Stage_Menu_menuItemGroupDivider_001] START');

      let strJson = getInspectorByKey('menuItemGroupDividerText');
      await sleep(200);
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUX_Stage_Menu_menuItemGroupDivider_001] component obj is: " + JSON.stringify(obj));
      await sleep(1000);

      expect(obj.$attrs.itemGroupDivider.strokeWidth).assertEqual('50.00vp');
      console.info('[ArkUX_Stage_Menu_menuItemGroupDivider_001] END');
      done();
    });

    /**
     * @tc.number    ArkUX_Stage_Menu_menuItemGroupDivider_0002
     * @tc.name      menuItemGroupDivider test
     * @tc.desc      menuItemGroupDivider test
     */

    it('ArkUX_Stage_Menu_menuItemGroupDivider_0002', Level.LEVEL2, async (done: Function) => {
      console.info('[ArkUX_Stage_Menu_menuItemGroupDivider_0002] START');

      let strJson = getInspectorByKey('menuItemGroupDividerText');
      await sleep(200);
      let obj: ESObject = JSON.parse(strJson);
      console.info(`[ArkUX_Stage_Menu_menuItemGroupDivider_0002] component obj is:${JSON.stringify(obj)}`);
      await sleep(1000);

      expect(obj.$attrs.itemGroupDivider.color).assertEqual('#FF0000FF');
      console.info('[ArkUX_Stage_Menu_menuItemGroupDivider_0002] END');
      done();
    })
  
    /**
     * @tc.number    ArkUX_Stage_Menu_menuItemGroupDivider_0003
     * @tc.name      menuItemGroupDivider test
     * @tc.desc      menuItemGroupDivider test
     */

    it('ArkUX_Stage_Menu_menuItemGroupDivider_0003', Level.LEVEL2, async (done: Function) => {
      console.info('[ArkUX_Stage_Menu_menuItemGroupDivider_0003] START');

      let strJson = getInspectorByKey('menuItemGroupDividerText');
      await sleep(200);
      let obj: ESObject = JSON.parse(strJson);
      console.info(`[ArkUX_Stage_Menu_menuItemGroupDivider_0003] component obj is:${JSON.stringify(obj)}`);
      await sleep(1000);

      expect(obj.$attrs.itemGroupDivider.startMargin).assertEqual('2.00vp');
      console.info('[ArkUX_Stage_Menu_menuItemGroupDivider_0003] END');
      done();
    });

    /**
     * @tc.number    ArkUX_Stage_Menu_menuItemGroupDivider_0004
     * @tc.name      menuItemDivider test
     * @tc.desc      menuItemDivider test
     */
    it('ArkUX_Stage_Menu_menuItemGroupDivider_0004', Level.LEVEL2, async (done: Function) => {
      console.info('[ArkUX_Stage_Menu_menuItemGroupDivider_0004] START');

      let strJson = getInspectorByKey('menuItemGroupDividerText');
      await sleep(200);
      let obj: ESObject = JSON.parse(strJson);
      console.info(`[ArkUX_Stage_Menu_menuItemGroupDivider_0004] component obj is:${JSON.stringify(obj)}`);
      await sleep(1000);

      expect(obj.$attrs.itemGroupDivider.endMargin).assertEqual('2.00vp');
      console.info('[ArkUX_Stage_Menu_menuItemGroupDivider_0004] END');
      done();
    });

    /**
     * @tc.number    ArkUX_Stage_Menu_menuItemGroupDivider_0005
     * @tc.name      menuItemGroupDivider test
     * @tc.desc      menuItemGroupDivider test
     */

    it('ArkUX_Stage_Menu_menuItemGroupDivider_0005', Level.LEVEL2, async (done: Function) => {
      console.info('[ArkUX_Stage_Menu_menuItemGroupDivider_0005] START');

      let strJson = getInspectorByKey('menuItemGroupDividerText1');
      await sleep(200);
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUX_Stage_Menu_menuItemGroupDivider_0005] component obj is: " + JSON.stringify(obj));
      await sleep(1000);

      expect(obj.$attrs.itemGroupDivider.strokeWidth).assertEqual('0.00invalid');
      console.info('[ArkUX_Stage_Menu_menuItemGroupDivider_0005] END');
      done();
    });

    /**
     * @tc.number    ArkUX_Stage_Menu_menuItemGroupDivider_0006
     * @tc.name      menuItemGroupDivider test
     * @tc.desc      menuItemGroupDivider test
     */

    it('ArkUX_Stage_Menu_menuItemGroupDivider_0006', Level.LEVEL2, async (done: Function) => {
      console.info('[ArkUX_Stage_Menu_menuItemGroupDivider_0006] START');

      let strJson = getInspectorByKey('menuItemGroupDividerText1');
      await sleep(200);
      let obj: ESObject = JSON.parse(strJson);
      console.info(`[ArkUX_Stage_Menu_menuItemGroupDivider_0006] component obj is:${JSON.stringify(obj)}`);
      await sleep(1000);

      expect(obj.$attrs.itemGroupDivider.color).assertEqual('#00000001');
      console.info('[ArkUX_Stage_Menu_menuItemGroupDivider_0006] END');
      done();
    })

    /**
     * @tc.number    ArkUX_Stage_Menu_menuItemGroupDivider_0007
     * @tc.name      menuItemGroupDivider test
     * @tc.desc      menuItemGroupDivider test
     */

    it('ArkUX_Stage_Menu_menuItemGroupDivider_0007', Level.LEVEL2, async (done: Function) => {
      console.info('[ArkUX_Stage_Menu_menuItemGroupDivider_006] START');

      let strJson = getInspectorByKey('menuItemGroupDividerText1');
      await sleep(200);
      let obj: ESObject = JSON.parse(strJson);
      console.info(`[ArkUX_Stage_Menu_menuItemGroupDivider_0007] component obj is:${JSON.stringify(obj)}`);
      await sleep(1000);

      expect(obj.$attrs.itemGroupDivider.startMargin).assertEqual('0.00invalid');
      console.info('[ArkUX_Stage_Menu_menuItemGroupDivider_0007] END');
      done();
    });
  
    /**
     * @tc.number    ArkUX_Stage_Menu_menuItemGroupDivider_0008
     * @tc.name      menuItemDivider test
     * @tc.desc      menuItemDivider test
     */
    it('ArkUX_Stage_Menu_menuItemGroupDivider_0008', Level.LEVEL2, async (done: Function) => {
      console.info('[ArkUX_Stage_Menu_menuItemGroupDivider_007] START');

      let strJson = getInspectorByKey('menuItemGroupDividerText1');
      await sleep(200);
      let obj: ESObject = JSON.parse(strJson);
      console.info(`[ArkUX_Stage_Menu_menuItemGroupDivider_0008] component obj is:${JSON.stringify(obj)}`);
      await sleep(1000);

      expect(obj.$attrs.itemGroupDivider.endMargin).assertEqual('0.00invalid');
      console.info('[ArkUX_Stage_Menu_menuItemGroupDivider_0008] END');
      done();
    });

    /**
     * @tc.number    ArkUX_Stage_Menu_menuItemGroupDivider_0009
     * @tc.name      menuItemGroupDivider test
     * @tc.desc      menuItemGroupDivider test
     */

    it('ArkUX_Stage_Menu_menuItemGroupDivider_0009', Level.LEVEL2, async (done: Function) => {
      console.info('[ArkUX_Stage_Menu_menuItemGroupDivider_0009] START');

      let strJson = getInspectorByKey('menuItemGroupDividerText2');
      await sleep(200);
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUX_Stage_Menu_menuItemGroupDivider_0009] component obj is: " + JSON.stringify(obj));
      await sleep(1000);

      expect(obj.$attrs.itemGroupDivider.strokeWidth).assertEqual('0.00invalid');
      console.info('[ArkUX_Stage_Menu_menuItemGroupDivider_0009] END');
      done();
    });

    /**
     * @tc.number    ArkUX_Stage_Menu_menuItemGroupDivider_0010
     * @tc.name      menuItemGroupDivider test
     * @tc.desc      menuItemGroupDivider test
     */

    it('ArkUX_Stage_Menu_menuItemGroupDivider_0010', Level.LEVEL2, async (done: Function) => {
      console.info('[ArkUX_Stage_Menu_menuItemGroupDivider_0010] START');

      let strJson = getInspectorByKey('menuItemGroupDividerText2');
      await sleep(200);
      let obj: ESObject = JSON.parse(strJson);
      console.info(`[ArkUX_Stage_Menu_menuItemGroupDivider_0010] component obj is:${JSON.stringify(obj)}`);
      await sleep(1000);

      expect(obj.$attrs.itemGroupDivider.color).assertEqual('#00000001');
      console.info('[ArkUX_Stage_Menu_menuItemGroupDivider_0010] END');
      done();
    })

    /**
     * @tc.number    ArkUX_Stage_Menu_menuItemGroupDivider_0011
     * @tc.name      menuItemGroupDivider test
     * @tc.desc      menuItemGroupDivider test
     */

    it('ArkUX_Stage_Menu_menuItemGroupDivider_0011', Level.LEVEL2, async (done: Function) => {
      console.info('[ArkUX_Stage_Menu_menuItemGroupDivider_0011] START');

      let strJson = getInspectorByKey('menuItemGroupDividerText2');
      await sleep(200);
      let obj: ESObject = JSON.parse(strJson);
      console.info(`[ArkUX_Stage_Menu_menuItemGroupDivider_0011] component obj is:${JSON.stringify(obj)}`);
      await sleep(1000);

      expect(obj.$attrs.itemGroupDivider.startMargin).assertEqual('0.00invalid');
      console.info('[ArkUX_Stage_Menu_menuItemGroupDivider_0011] END');
      done();
    });

    /**
     * @tc.number    ArkUX_Stage_Menu_menuItemGroupDivider_0012
     * @tc.name      menuItemDivider test
     * @tc.desc      menuItemDivider test
     */
    it('ArkUX_Stage_Menu_menuItemGroupDivider_0012', Level.LEVEL2, async (done: Function) => {
      console.info('[ArkUX_Stage_Menu_menuItemGroupDivider_0013] START');

      let strJson = getInspectorByKey('menuItemGroupDividerText2');
      await sleep(200);
      let obj: ESObject = JSON.parse(strJson);
      console.info(`[ArkUX_Stage_Menu_menuItemGroupDivider_0012] component obj is:${JSON.stringify(obj)}`);
      await sleep(1000);

      expect(obj.$attrs.itemGroupDivider.endMargin).assertEqual('0.00invalid');
      console.info('[ArkUX_Stage_Menu_menuItemGroupDivider_0012] END');
      done();
    });
 
    /**
       * @tc.number    ArkUX_Stage_Menu_menuItemGroupDivider_0013
       * @tc.name      menuItemGroupDivider test
       * @tc.desc      menuItemGroupDivider test
       */

      it('ArkUX_Stage_Menu_menuItemGroupDivider_0013', Level.LEVEL2, async (done: Function) => {
        console.info('[ArkUX_Stage_Menu_menuItemGroupDivider_0013] START');
  
        let strJson = getInspectorByKey('menuItemGroupDividerText3');
        await sleep(200);
        let obj: ESObject = JSON.parse(strJson);
        console.info(`[ArkUX_Stage_Menu_menuItemGroupDivider_0013] component obj is:${JSON.stringify(obj)}`);
        await sleep(1000);
  
        expect(obj.$attrs.itemGroupDivider.color).assertEqual('#FF000000');
        console.info('[ArkUX_Stage_Menu_menuItemGroupDivider_0013] END');
        done();
      })

    /**
     * @tc.number    ArkUX_Stage_Menu_menuItemGroupDivider_0014
     * @tc.name      menuItemGroupDivider test
     * @tc.desc      subMenuExpandingMode test
     */
    it('ArkUX_Stage_Menu_menuItemGroupDivider_0014', Level.LEVEL2, async (done: Function) => {
        console.info('[ArkUX_Stage_Menu_menuItemGroupDivider_0014] START');
  
        let strJson = getInspectorByKey('menuItemGroupDividerText');
        await sleep(200);
        let obj: ESObject = JSON.parse(strJson);
        console.info("[ArkUX_Stage_Menu_menuItemGroupDivider_0014] component obj is: " + JSON.stringify(obj));
        await sleep(1000);
  
        expect(obj.$attrs.subMenuExpandingMode).assertEqual('SubMenuExpandingMode.SIDE');
        console.info('[ArkUX_Stage_Menu_menuItemGroupDivider_0014] END');
        done();
      });
      
    /**
     * @tc.number    ArkUX_Stage_Menu_menuItemGroupDivider_0015
     * @tc.name      menuItemGroupDivider test
     * @tc.desc      subMenuExpandingMode test
     */
    it('ArkUX_Stage_Menu_menuItemGroupDivider_0015', Level.LEVEL2, async (done: Function) => {
      console.info('[ArkUX_Stage_Menu_menuItemGroupDivider_0015] START');

      let strJson = getInspectorByKey('menuItemGroupDividerText1');
      await sleep(200);
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUX_Stage_Menu_menuItemGroupDivider_0015] component obj is: " + JSON.stringify(obj));
      await sleep(1000);

      expect(obj.$attrs.subMenuExpandingMode).assertEqual('SubMenuExpandingMode.EMBEDDED');
      console.info('[ArkUX_Stage_Menu_menuItemGroupDivider_0015] END');
      done();
    });
      
    /**
     * @tc.number    ArkUX_Stage_Menu_menuItemGroupDivider_0016
     * @tc.name      menuItemGroupDivider test
     * @tc.desc      subMenuExpandingMode test
     */
    it('ArkUX_Stage_Menu_menuItemGroupDivider_0016', Level.LEVEL2, async (done: Function) => {
      console.info('[ArkUX_Stage_Menu_menuItemGroupDivider_0016] START');

      let strJson = getInspectorByKey('menuItemGroupDividerText2');
      await sleep(200);
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUX_Stage_Menu_menuItemGroupDivider_0016] component obj is: " + JSON.stringify(obj));
      await sleep(1000);

      expect(obj.$attrs.subMenuExpandingMode).assertEqual('SubMenuExpandingMode.STACK');
      console.info('[ArkUX_Stage_Menu_menuItemGroupDivider_0016] END');
      done();
    });

  })
}