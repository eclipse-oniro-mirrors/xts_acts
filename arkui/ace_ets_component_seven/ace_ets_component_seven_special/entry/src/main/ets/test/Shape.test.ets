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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium'
import router from '@ohos.router'
import Utils from './Utils';

export default function shape(){
  describe("shapeJsunit", () => {
    beforeEach(async (done: Function) => {
      console.info("shapeJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/shape',
      }
      let result: ESObject;
      try{
        router.clear();
        let pages = router.getState();
        console.info("get shape state pages: " + JSON.stringify(pages));
        if (!("shape" == pages.name)) {
          console.info("get shape state pages.name: " + JSON.stringify(pages.name));
          result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push shape page result: " + JSON.stringify(result));
        }
      }catch(err) {
        console.error("push panel page error: " + err);
      }
      done();
    });

    /**
     * @tc.name   ShapeJsunit_001
     * @tc.number ShapeJsunit_001
     * @tc.desc   Set attribute values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ShapeJsunit_001', Level.LEVEL0, async (done: Function) => {
      console.info('[ShapeJsunit_001] START');
      let strJson = getInspectorByKey('ShapeKey1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ShapeJsunit_001] obj  is: " + JSON.stringify(obj.$attrs));
      
      expect(obj.$attrs.viewPort.x).assertEqual("1.00vp");
      expect(obj.$attrs.viewPort.y).assertEqual("-2.00vp");
      expect(obj.$attrs.viewPort.width).assertEqual("100.00vp");
      expect(obj.$attrs.viewPort.height).assertEqual("200.00vp");

      console.info('[ShapeJsunit_001] END');
      done();
    });

    /**
     * @tc.name   ShapeJsunit_002
     * @tc.number ShapeJsunit_002
     * @tc.desc   Set attribute values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ShapeJsunit_002', Level.LEVEL0, async (done: Function) => {
      console.info('[ShapeJsunit_002] START');
      let strJson = getInspectorByKey('ShapeKey1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ShapeJsunit_002] obj  is: " + JSON.stringify(obj.$attrs));
      
      expect(obj.$attrs.stroke).assertEqual("#FFFFC0CB");

      console.info('[ShapeJsunit_002] END');
      done();
    });

    /**
     * @tc.name   ShapeJsunit_003
     * @tc.number ShapeJsunit_003
     * @tc.desc   Set attribute values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ShapeJsunit_003', Level.LEVEL0, async (done: Function) => {
      console.info('[ShapeJsunit_003] START');
      let strJson = getInspectorByKey('ShapeKey1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ShapeJsunit_003] obj  is: " + JSON.stringify(obj.$attrs));
      
      expect(obj.$attrs.fill).assertEqual("#FF317AF7");

      console.info('[ShapeJsunit_003] END');
      done();
    });

    /**
     * @tc.name   ShapeJsunit_004
     * @tc.number ShapeJsunit_004
     * @tc.desc   Set attribute values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ShapeJsunit_004', Level.LEVEL0, async (done: Function) => {
      console.info('[ShapeJsunit_004] START');
      let strJson = getInspectorByKey('ShapeKey1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ShapeJsunit_004] obj  is: " + JSON.stringify(obj.$attrs));
      
      expect(obj.$attrs.strokeDashOffset).assertEqual("15.00vp");

      console.info('[ShapeJsunit_004] END');
      done();
    });

    /**
     * @tc.name   ShapeJsunit_005
     * @tc.number ShapeJsunit_005
     * @tc.desc   Set attribute values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ShapeJsunit_005', Level.LEVEL0, async (done: Function) => {
      console.info('[ShapeJsunit_005] START');
      let strJson = getInspectorByKey('ShapeKey1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ShapeJsunit_005] obj  is: " + JSON.stringify(obj.$attrs));
      
      expect(obj.$attrs.strokeDashArray[0]).assertEqual('30.00vp');
      console.info('[ShapeJsunit_005] END');
      done();
    });

    /**
     * @tc.name   ShapeJsunit_006
     * @tc.number ShapeJsunit_006
     * @tc.desc   Set attribute values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ShapeJsunit_006', Level.LEVEL0, async (done: Function) => {
      console.info('[ShapeJsunit_006] START');
      let strJson = getInspectorByKey('ShapeKey1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ShapeJsunit_006] obj  is: " + JSON.stringify(obj.$attrs));
      
      expect(obj.$attrs.strokeLineJoin).assertEqual("LineJoinStyle.Round");

      console.info('[ShapeJsunit_006] END');
      done();
    });

    /**
     * @tc.name   ShapeJsunit_007
     * @tc.number ShapeJsunit_007
     * @tc.desc   Set attribute values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ShapeJsunit_007', Level.LEVEL0, async (done: Function) => {
      console.info('[ShapeJsunit_007] START');
      let strJson = getInspectorByKey('ShapeKey1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ShapeJsunit_007] obj  is: " + JSON.stringify(obj.$attrs));
      
      expect(obj.$attrs.strokeLineCap).assertEqual("LineCapStyle.Round");

      console.info('[ShapeJsunit_007] END');
      done();
    });

    /**
     * @tc.name   ShapeJsunit_008
     * @tc.number ShapeJsunit_008
     * @tc.desc   Set attribute values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ShapeJsunit_008', Level.LEVEL0, async (done: Function) => {
      console.info('[ShapeJsunit_008] START');
      let strJson = getInspectorByKey('ShapeKey1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ShapeJsunit_008] obj  is: " + JSON.stringify(obj.$attrs));
      
      expect(obj.$attrs.strokeOpacity).assertEqual("0.500000");

      console.info('[ShapeJsunit_008] END');
      done();
    });

    /**
     * @tc.name   ShapeJsunit_009
     * @tc.number ShapeJsunit_009
     * @tc.desc   Set attribute values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ShapeJsunit_009', Level.LEVEL0, async (done: Function) => {
      console.info('[ShapeJsunit_009] START');
      let strJson = getInspectorByKey('ShapeKey1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ShapeJsunit_009] obj  is: " + JSON.stringify(obj.$attrs));
      
      expect(obj.$attrs.strokeMiterLimit).assertEqual("5.000000");

      console.info('[ShapeJsunit_009] END');
      done();
    });

    /**
     * @tc.name   ShapeJsunit_0010
     * @tc.number ShapeJsunit_0010
     * @tc.desc   Set attribute values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ShapeJsunit_0010', Level.LEVEL0, async (done: Function) => {
      console.info('[ShapeJsunit_0010] START');
      let strJson = getInspectorByKey('ShapeKey1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ShapeJsunit_0010] obj  is: " + JSON.stringify(obj.$attrs));
      
      expect(obj.$attrs.mesh.value[0]).assertEqual('10.000000');
      expect(obj.$attrs.mesh.row).assertEqual(1);
      expect(obj.$attrs.mesh.column).assertEqual(1);

      console.info('[ShapeJsunit_0010] END');
      done();
    });

    /**
     * @tc.name   ShapeJsunit_0011
     * @tc.number ShapeJsunit_0011
     * @tc.desc   Set attribute values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ShapeJsunit_0011', Level.LEVEL0, async (done: Function) => {
      console.info('[ShapeJsunit_0011] START');
      let strJson = getInspectorByKey('ShapeKey1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ShapeJsunit_0011] obj  is: " + JSON.stringify(obj.$attrs));
      
      expect(obj.$attrs.strokeWidth).assertEqual(20);

      console.info('[ShapeJsunit_0011] END');
      done();
    });

    /**
     * @tc.name   ShapeJsunit_0012
     * @tc.number ShapeJsunit_0012
     * @tc.desc   Set attribute values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ShapeJsunit_0012', Level.LEVEL0, async (done: Function) => {
      console.info('[ShapeJsunit_0012] START');
      let strJson = getInspectorByKey('ShapeKey1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ShapeJsunit_0012] obj  is: " + JSON.stringify(obj.$attrs));
      
      expect(obj.$attrs.fillOpacity).assertEqual("1.000000");

      console.info('[ShapeJsunit_0012] END');
      done();
    });

    /**
     * @tc.name   ShapeJsunit_0013
     * @tc.number ShapeJsunit_0013
     * @tc.desc   Set attribute values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ShapeJsunit_0013', Level.LEVEL0, async (done: Function) => {
      console.info('[ShapeJsunit_0013] START');
      let strJson = getInspectorByKey('ShapeKey1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ShapeJsunit_0013] obj  is: " + JSON.stringify(obj.$attrs));
      
      expect(obj.$attrs.antiAlias).assertEqual("true");
      console.info('[ShapeJsunit_0013] END');
      done();
    });


  })
}