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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import router from '@ohos.router';
import Utils from './Utils';
import { UiDriver, UiComponent, BY, Driver, Component, ON } from '@ohos.UiTest'

export default function common1Jsunit() {
  describe('common_part1Test', () => {
    beforeEach(async (done: Function) => {
      console.info("Common1 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/common1',
      }

      try {
        router.clear();
        let pages = router.getState();
        console.info("get Common1 state pages: " + JSON.stringify(pages));
        if (!("common1" == pages.name)) {
          console.info("get Common1 state pages.name: " + JSON.stringify(pages.name));
          await router.pushUrl(options);
          await Utils.sleep(2000);
        }
      } catch (err) {
        console.error("push Common1 page error: " + err);
      }
      done();
    });

    beforeEach(async () => {
      await Utils.sleep(100);
      console.info("Common1 before each called");
    })

    /**
     * @tc.number Common001
     * @tc.name Test the properties of components
     * @tc.desc Set outlineRadius values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('Common1001', 0, async (done: Function) => {
      console.info('[Common1001] START');
      let strJsonNew = getInspectorByKey('common1');
      let objNew = JSON.parse(strJsonNew);
      console.info("[Common1001] component Common1001 is: " + JSON.stringify(objNew.$attrs));
      let outlineRadius = objNew.$attrs.outlineRadius
      expect(outlineRadius.topLeft).assertEqual("10.00vp");
      expect(outlineRadius.topRight).assertEqual("10.00vp");
      expect(outlineRadius.bottomLeft).assertEqual("20.00vp");
      expect(outlineRadius.bottomRight).assertEqual("13.00vp");
      done();
    });

    /**
     * @tc.number Common1002
     * @tc.name Test the properties of components
     * @tc.desc Set outlineStyle values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('Common1002', 0, async (done: Function) => {
      console.info('[Common1002] START');
      let strJsonNew = getInspectorByKey('common1');
      let objNew = JSON.parse(strJsonNew);
      console.info("[Common1002] component Common1002 is: " + JSON.stringify(objNew.$attrs));
      let outlineStyle = objNew.$attrs.outlineStyle
      expect(outlineStyle.left).assertEqual("OutlineStyle.SOLID");
      expect(outlineStyle.top).assertEqual("OutlineStyle.SOLID");
      expect(outlineStyle.right).assertEqual("OutlineStyle.SOLID");
      expect(outlineStyle.bottom).assertEqual("OutlineStyle.SOLID");
      done();
    });

    /**
     * @tc.number Common1003
     * @tc.name Test the properties of components
     * @tc.desc Set outlineWidth values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('Common1003', 0, async (done: Function) => {
      console.info('[Common1003] START');
      let strJsonNew = getInspectorByKey('common1');
      let objNew = JSON.parse(strJsonNew);
      console.info("[Common1003] component Common1003 is: " + JSON.stringify(objNew.$attrs));
      let outlineWidth = objNew.$attrs.outlineWidth
      expect(outlineWidth.left).assertEqual("2.00vp");
      expect(outlineWidth.top).assertEqual("2.00vp");
      expect(outlineWidth.right).assertEqual("2.00vp");
      expect(outlineWidth.bottom).assertEqual("2.00vp");
      done();
    });

    /**
     * @tc.number Common1004
     * @tc.name Test the properties of components
     * @tc.desc Set outlineColor values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('Common1004', 0, async (done: Function) => {
      console.info('[Common1004] START');
      let strJsonNew = getInspectorByKey('common1');
      let objNew = JSON.parse(strJsonNew);
      console.info("[Common1004] component Common1004 is: " + JSON.stringify(objNew.$attrs));
      let outlineColor = objNew.$attrs.outlineColor
      expect(outlineColor.left).assertEqual("#FFFFC0CB");
      expect(outlineColor.top).assertEqual("#FFFFC0CB");
      expect(outlineColor.right).assertEqual("#FFFFC0CB");
      expect(outlineColor.bottom).assertEqual("#FFFFC0CB");
      done();
    });

    /**
     * @tc.number Common1005
     * @tc.name Test the properties of components
     * @tc.desc Set align values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('Common1005', 0, async (done: Function) => {
      console.info('[Common1005] START');
      let strJsonNew = getInspectorByKey('common1');
      let objNew = JSON.parse(strJsonNew);
      console.info("[Common1005] component Common1005 is: " + JSON.stringify(objNew.$attrs));
      expect(objNew.$attrs.align).assertEqual("Alignment.TopStart");
      done();
    });

    /**
     * @tc.number Common1006
     * @tc.name Test the properties of components
     * @tc.desc Set direction values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('Common1006', 0, async (done: Function) => {
      console.info('[Common1006] START');
      let strJsonNew = getInspectorByKey('common1');
      let objNew = JSON.parse(strJsonNew);
      console.info("[Common1006] component Common1006 is: " + JSON.stringify(objNew.$attrs));
      expect(objNew.$attrs.direction).assertEqual("Direction.Ltr");
      done();
    });

    /**
     * @tc.number Common1007
     * @tc.name Test the properties of components
     * @tc.desc Set backdropBlur values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('Common1007', 0, async (done: Function) => {
      console.info('[Common1007] START');
      let strJsonNew = getInspectorByKey('common1');
      let objNew = JSON.parse(strJsonNew);
      console.info("[Common1007] component Common1007 is: " + JSON.stringify(objNew.$attrs));
      expect(objNew.$attrs.backdropBlur).assertEqual(20);
      done();
    });

    /**
     * @tc.number Common1008
     * @tc.name Test the properties of components
     * @tc.desc Set invert values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('Common1008', 0, async (done: Function) => {
      console.info('[Common1008] START');
      let strJsonNew = getInspectorByKey('common1');
      let objNew = JSON.parse(strJsonNew);
      console.info("[Common1008] component Common1008 is: " + JSON.stringify(objNew.$attrs));
      expect(objNew.$attrs.invert).assertEqual(0.5);
      done();
    });

    /**
     * @tc.number Common1009
     * @tc.name Test the properties of components
     * @tc.desc Set blur values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('Common1009', 0, async (done: Function) => {
      console.info('[Common1009] START');
      let strJsonNew = getInspectorByKey('common1');
      let objNew = JSON.parse(strJsonNew);
      console.info("[Common1009] component Common1009 is: " + JSON.stringify(objNew.$attrs));
      expect(objNew.$attrs.blur).assertEqual(15);
      done();
    });

    /**
     * @tc.number Common1010
     * @tc.name Test the properties of components
     * @tc.desc Set outline values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('Common1010', 0, async (done: Function) => {
      console.info('[Common1010] START');
      let strJsonNew = getInspectorByKey('common2');
      let objNew = JSON.parse(strJsonNew);
      console.info("[Common1010] component Common1010 is: " + JSON.stringify(objNew.$attrs));
      let outline = JSON.parse(objNew.$attrs.outline);
      expect(outline.width.left).assertEqual("10.00vp");
      expect(outline.width.top).assertEqual("10.00vp");
      expect(outline.width.right).assertEqual("10.00vp");
      expect(outline.width.bottom).assertEqual("10.00vp");
      done();
    });

    /**
     * @tc.number Common1011
     * @tc.name Test the properties of components
     * @tc.desc Set useShadowBatching values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('Common1011', 0, async (done: Function) => {
      console.info('[Common1011] START');
      let strJsonNew = getInspectorByKey('common2');
      let objNew = JSON.parse(strJsonNew);
      console.info("[Common1011] component Common1011 is: " + JSON.stringify(objNew.$attrs));
      expect(objNew.$attrs.useShadowBatching).assertEqual("true");
      done();
    });

    /**
     * @tc.number Common1012
     * @tc.name Test the properties of components
     * @tc.desc Set obscured values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('Common1012', 0, async (done: Function) => {
      console.info('[Common1012] START');
      let strJsonNew = getInspectorByKey('common2');
      let objNew = JSON.parse(strJsonNew);
      console.info("[Common1012] component Common1012 is: " + JSON.stringify(objNew.$attrs));
      expect(objNew.$attrs.obscured[0]).assertEqual("1");
      done();
    });

    /**
     * @tc.number Common1013
     * @tc.name Test the properties of components
     * @tc.desc Set shadow values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('Common1013', 0, async (done: Function) => {
      console.info('[Common1013] START');
      let strJsonNew = getInspectorByKey('common2');
      let objNew = JSON.parse(strJsonNew);
      console.info("[Common1013] component Common1013 is: " + JSON.stringify(objNew.$attrs));
      let shadow = objNew.$attrs.shadow;
      expect(shadow.radius).assertEqual("10.000000");
      done();
    });

    /**
     * @tc.number Common1014
     * @tc.name Test the properties of components
     * @tc.desc Set renderFit values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('Common1014', 0, async (done: Function) => {
      console.info('[Common1014] START');
      let strJsonNew = getInspectorByKey('common2');
      let objNew = JSON.parse(strJsonNew);
      console.info("[Common1014] component Common1014 is: " + JSON.stringify(objNew.$attrs));
      expect(objNew.$attrs.renderFit).assertEqual("RenderFit.CENTER");
      done();
    });

    /**
     * @tc.number Common1015
     * @tc.name Test the properties of components
     * @tc.desc Set clip values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('Common1015', 0, async (done: Function) => {
      console.info('[Common1015] START');
      let strJsonNew = getInspectorByKey('common2');
      let objNew = JSON.parse(strJsonNew);
      console.info("[Common1015] component Common1015 is: " + JSON.stringify(objNew.$attrs));
      expect(objNew.$attrs.clip).assertEqual("false");
      done();
    });

    /**
     * @tc.number Common1016
     * @tc.name Test the properties of components
     * @tc.desc Set radialGradient values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('Common1016', 0, async (done: Function) => {
      console.info('[Common1016] START');
      let strJsonNew = getInspectorByKey('common2');
      let objNew = JSON.parse(strJsonNew);
      console.info("[Common1016] component Common1016 is: " + JSON.stringify(objNew.$attrs));
      expect(objNew.$attrs.radialGradient.radius).assertEqual("15.00vp");
      expect(true).assertEqual(true);
      done();
    });

    /**
     * @tc.number Common1017
     * @tc.name Test the properties of components
     * @tc.desc Set sweepGradient values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('Common1017', 0, async (done: Function) => {
      console.info('[Common1017] START');
      let strJsonNew = getInspectorByKey('common2');
      let objNew = JSON.parse(strJsonNew);
      console.info("[Common1017] component Common1017 is: " + JSON.stringify(objNew.$attrs));
      expect(objNew.$attrs.sweepGradient.start).assertEqual("100.00px");
      expect(objNew.$attrs.sweepGradient.end).assertEqual("359.00px");
      expect(true).assertEqual(true);
      done();
    });

    /**
     * @tc.number Common1018
     * @tc.name Test the properties of components
     * @tc.desc Set mask values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('Common1018', 0, async (done: Function) => {
      console.info('[Common1018] START');
      let strJsonNew = getInspectorByKey('common3');
      let objNew = JSON.parse(strJsonNew);
      console.info("[Common1018] component Common1018 is: " + JSON.stringify(objNew.$attrs));
      expect(objNew.$attrs.mask.shape).assertEqual("Rect");
      done();
    });

    /**
     * @tc.number Common1019
     * @tc.name Test the properties of components
     * @tc.desc Set id values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('Common1019', 0, async (done: Function) => {
      console.info('[Common1019] START');
      let strJsonNew = getInspectorByKey('testid');
      console.info("[Common1019] component Common1017 is: " + strJsonNew);
      expect(strJsonNew).assertNotNull;
      done();
    });

    /**
     * @tc.number Common1020
     * @tc.name Test the properties of components
     * @tc.desc Set key values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('Common1020', 0, async (done: Function) => {
      console.info('[Common1020] START');
      let strJsonNew = getInspectorByKey('testkey');
      expect(strJsonNew).assertNotNull;
      done();
    });

    /**
     * @tc.number Common1021
     * @tc.name Test the properties of components
     * @tc.desc Set overlay values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('Common1021', 0, async (done: Function) => {
      console.info('[Common1021] START');
      let strJsonNew = getInspectorByKey('common3');
      let objNew = JSON.parse(strJsonNew);
      console.info("[Common1021] component Common1021 is: " + JSON.stringify(objNew.$attrs));
      expect(objNew.$attrs.overlay.title).assertEqual("Winter");
      done();
    });

    /**
     * @tc.number Common1022
     * @tc.name Test the properties of components
     * @tc.desc Set draggable values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('Common1022', 0, async (done: Function) => {
      console.info('[Common1022] START');
      let strJsonNew = getInspectorByKey('common3');
      let objNew = JSON.parse(strJsonNew);
      console.info("[Common1022] component Common1022 is: " + JSON.stringify(objNew.$attrs));
      expect(objNew.$attrs.draggable).assertEqual("true");
      done();
    });

    /**
     * @tc.number Common1023
     * @tc.name Test the properties of components
     * @tc.desc Set aspectRatio values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('Common1023', 0, async (done: Function) => {
      console.info('[Common1023] START');
      let strJsonNew = getInspectorByKey('common2');
      let objNew = JSON.parse(strJsonNew);
      console.info("[Common1023] component Common1023 is: " + JSON.stringify(objNew.$attrs));
      expect(objNew.$attrs.aspectRatio).assertEqual(2);
      done();
    });

    /**
     * @tc.number Common1024
     * @tc.name Test the properties of components
     * @tc.desc Set aspectRatio values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('Common1024', 0, async (done: Function) => {
      console.info('[Common1024] START');
      let strJsonNew = getInspectorByKey('common3');
      let objNew = JSON.parse(strJsonNew);
      console.info("[Common1024] component Common1024 is: " + JSON.stringify(objNew.$attrs));
      expect(objNew.$attrs.enabled).assertEqual(false);
      done();
    });

    /**
     * @tc.number Common1025
     * @tc.name Test the properties of components
     * @tc.desc Set offset values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('Common1025', 0, async (done: Function) => {
      console.info('[Common1025] START');
      let strJsonNew = getInspectorByKey('common2');
      let objNew = JSON.parse(strJsonNew);
      console.info("[Common1025] component Common1025 is: " + JSON.stringify(objNew.$attrs));
      expect(objNew.$attrs.offset.x).assertEqual("10.00px");
      expect(objNew.$attrs.offset.y).assertEqual("20.00px");
      done();
    });

    /**
     * @tc.number Common1026
     * @tc.name Test the properties of components
     * @tc.desc Set markAnchor values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('Common1026', 0, async (done: Function) => {
      console.info('[Common1026] START');
      let strJsonNew = getInspectorByKey('common2');
      let objNew = JSON.parse(strJsonNew);
      console.info("[Common1026] component Common1026 is: " + JSON.stringify(objNew.$attrs));
      expect(objNew.$attrs.markAnchor.x).assertEqual("15.00px");
      expect(objNew.$attrs.markAnchor.y).assertEqual("25.00px");
      done();
    });

    /**
     * @tc.number Common1027
     * @tc.name Test the properties of components
     * @tc.desc Set position values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('Common1027', 0, async (done: Function) => {
      console.info('[Common1027] START');
      let strJsonNew = getInspectorByKey('common2');
      let objNew = JSON.parse(strJsonNew);
      console.info("[Common1027] component Common1027 is: " + JSON.stringify(objNew.$attrs));
      expect(objNew.$attrs.position.x).assertEqual("20.00px");
      expect(objNew.$attrs.position.y).assertEqual("30.00px");
      done();
    });

    /**
     * @tc.number Common1028
     * @tc.name Test the properties of components
     * @tc.desc Set zIndex values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('Common1028', 0, async (done: Function) => {
      console.info('[Common1028] START');
      let strJsonNew = getInspectorByKey('common1');
      let objNew = JSON.parse(strJsonNew);
      console.info("[Common1028] component Common1028 is: " + JSON.stringify(objNew.$attrs));
      expect(objNew.$attrs.zIndex).assertEqual(2);
      done();
    });

    /**
     * @tc.number Common1029
     * @tc.name Test the properties of components
     * @tc.desc Set alignSelf values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('Common1029', 0, async (done: Function) => {
      console.info('[Common1029] START');
      let strJsonNew = getInspectorByKey('common1');
      let objNew = JSON.parse(strJsonNew);
      console.info("[Common1029] component Common1029 is: " + JSON.stringify(objNew.$attrs));
      expect(objNew.$attrs.alignSelf).assertEqual("ItemAlign.Start");
      done();
    });

    /**
     * @tc.number Common1030
     * @tc.name Test the properties of components
     * @tc.desc Set flexBasis values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('Common1030', 0, async (done: Function) => {
      console.info('[Common1030] START');
      let strJsonNew = getInspectorByKey('common1');
      let objNew = JSON.parse(strJsonNew);
      console.info("[Common1030] component Common1030 is: " + JSON.stringify(objNew.$attrs));
      expect(objNew.$attrs.flexBasis).assertEqual("20.00vp");
      done();
    });

    /**
     * @tc.number Common1031
     * @tc.name Test the properties of components
     * @tc.desc Set flexGrow values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('Common1031', 0, async (done: Function) => {
      console.info('[Common1031] START');
      let strJsonNew = getInspectorByKey('common1');
      let objNew = JSON.parse(strJsonNew);
      console.info("[Common1031] component Common1031 is: " + JSON.stringify(objNew.$attrs));
      expect(objNew.$attrs.flexGrow).assertEqual(3);
      done();
    });


    /**
     * @tc.number Common1032
     * @tc.name Test the properties of components
     * @tc.desc Set flexShrink values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('Common1032', 0, async (done: Function) => {
      console.info('[Common1032] START');
      let strJsonNew = getInspectorByKey('common1');
      let objNew = JSON.parse(strJsonNew);
      console.info("[Common1032] component Common1032 is: " + JSON.stringify(objNew.$attrs));
      expect(objNew.$attrs.flexShrink).assertEqual(4);
      done();
    });

    /**
     * @tc.number Common1033
     * @tc.name Test the properties of components
     * @tc.desc Set displayPriority values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('Common1033', 0, async (done: Function) => {
      console.info('[Common1033] START');
      let strJsonNew = getInspectorByKey('common1');
      let objNew = JSON.parse(strJsonNew);
      console.info("[Common1033] component Common1033 is: " + JSON.stringify(objNew.$attrs));
      expect(objNew.$attrs.displayPriority).assertEqual(2);
      done();
    });

    /**
     * @tc.number Common1034
     * @tc.name Test the properties of components
     * @tc.desc Set backgroundEffect values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('Common1034', 0, async (done: Function) => {
      console.info('[Common1034] START');
      let strJsonNew = getInspectorByKey('common3');
      let objNew = JSON.parse(strJsonNew);
      console.info("[Common1034] component Common1034 is: " + JSON.stringify(objNew.$attrs));
      expect(objNew.$attrs.backgroundEffect.options.color).assertEqual("#FF008000");
      done();
    });

    /**
     * @tc.number Common1035
     * @tc.name Test the properties of components
     * @tc.desc Set transform values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('Common1035', 0, async (done: Function) => {
      console.info('[Common1035] START');
      let strJsonNew = getInspectorByKey('common1');
      let objNew = JSON.parse(strJsonNew);
      console.info("[Common1035] component Common1035 is: " + JSON.stringify(objNew.$attrs));
      expect(objNew.$attrs.transform.type).assertEqual("matrix");
      done();
    });

    /**
     * @tc.number Common1036
     * @tc.name Test the properties of components
     * @tc.desc Set translate values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('Common1036', 0, async (done: Function) => {
      console.info('[Common1036] START');
      let strJsonNew = getInspectorByKey('common1');
      let objNew = JSON.parse(strJsonNew);
      console.info("[Common1036] component Common1036 is: " + JSON.stringify(objNew.$attrs));
      expect(objNew.$attrs.translate.x).assertEqual("30.00vp");
      expect(objNew.$attrs.translate.y).assertEqual("10.00vp");
      done();
    });

    /**
     * @tc.number Common1037
     * @tc.name Test the properties of components
     * @tc.desc Set rotate values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('Common1037', 0, async (done: Function) => {
      console.info('[Common1037] START');
      let strJsonNew = getInspectorByKey('common1');
      let objNew = JSON.parse(strJsonNew);
      console.info("[Common1037] component Common1037 is: " + JSON.stringify(objNew.$attrs));
      expect(objNew.$attrs.rotate.angle).assertEqual("10.000000");
      done();
    });

    /**
     * @tc.number Common1038
     * @tc.name Test the properties of components
     * @tc.desc Set renderGroup values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('Common1038', 0, async (done: Function) => {
      console.info('[Common1038] START');
      let strJsonNew = getInspectorByKey('common2');
      let objNew = JSON.parse(strJsonNew);
      console.info("[Common1038] component Common1038 is: " + JSON.stringify(objNew.$attrs));
      expect(objNew.$attrs.renderGroup).assertEqual("true");
      done();
    });


    /**
     * @tc.number Common1039
     * @tc.name Test the properties of components
     * @tc.desc Set gridOffset values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('Common1039', 0, async (done: Function) => {
      console.info('[Common1039] START');
      let strJsonNew = getInspectorByKey('common2');
      let objNew = JSON.parse(strJsonNew);
      console.info("[Common1039] component Common1039 is: " + JSON.stringify(objNew.$attrs));
      expect(objNew.$attrs.gridOffset).assertEqual(2);
      done();
    });

    /**
     * @tc.number Common1040
     * @tc.name Test the properties of components
     * @tc.desc Set gridSpan values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('Common1040', 0, async (done: Function) => {
      console.info('[Common1040] START');
      let strJsonNew = getInspectorByKey('common2');
      let objNew = JSON.parse(strJsonNew);
      console.info("[Common1040] component Common1040 is: " + JSON.stringify(objNew.$attrs));
      expect(objNew.$attrs.gridSpan).assertEqual(3);
      done();
    });

    /**
     * @tc.number Common1041
     * @tc.name Test the properties of components
     * @tc.desc Set hueRotate values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('Common1041', 0, async (done: Function) => {
      console.info('[Common1041] START');
      let strJsonNew = getInspectorByKey('common2');
      let objNew = JSON.parse(strJsonNew);
      console.info("[Common1041] component Common1041 is: " + JSON.stringify(objNew.$attrs));
      expect(objNew.$attrs.hueRotate).assertEqual(1);
      done();
    });

    /**
     * @tc.number Common1042
     * @tc.name Test the properties of components
     * @tc.desc Set sepia values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('Common1042', 0, async (done: Function) => {
      console.info('[Common1042] START');
      let strJsonNew = getInspectorByKey('common2');
      let objNew = JSON.parse(strJsonNew);
      console.info("[Common1042] component Common1042 is: " + JSON.stringify(objNew.$attrs));
      expect(objNew.$attrs.sepia).assertEqual(1);
      done();
    });

    /**
     * @tc.number Common1043
     * @tc.name Test the properties of components
     * @tc.desc Set clickEffect values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('Common1043', 0, async (done: Function) => {
      console.info('[Common1043] START');
      let strJsonNew = getInspectorByKey('testbutton');
      let objNew = JSON.parse(strJsonNew);
      console.info("[Common1043] component Common1043 is: " + JSON.stringify(objNew.$attrs.clickEffect));
      // let clickEffect = JSON.parse(objNew.$attrs.clickEffect);
      expect(objNew.$attrs.clickEffect.level).assertEqual("2");
      expect(objNew.$attrs.clickEffect.scale).assertEqual("1.000000");
      done();
    });

    /**
     * @tc.number Common1044
     * @tc.name Test the properties of components
     * @tc.desc Set hoverEffect values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('Common1044', 0, async (done: Function) => {
      console.info('[Common1044] START');
      let strJsonNew = getInspectorByKey('testbutton');
      let objNew = JSON.parse(strJsonNew);
      console.info("[Common1044] hoverEffect obj is: " + JSON.stringify(objNew.$attrs.hoverEffect));
      expect(objNew.$attrs.hoverEffect).assertEqual("HoverEffect.Auto");
      done();
    });

    /**
     * @tc.number Common1046
     * @tc.name Test the properties of components
     * @tc.desc change zIndex values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('Common1046', 0, async (done: Function) => {
      console.info('[Common1046] START');
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('changeButton'));
      await button.click();
      await Utils.sleep(2000)
      let strJsonNew = getInspectorByKey('common1');
      let objNew = JSON.parse(strJsonNew);
      console.info("[Common1046] component Common1046 is: " + JSON.stringify(objNew.$attrs));
      expect(objNew.$attrs.zIndex).assertEqual(5);
      done();
    });
  })
}