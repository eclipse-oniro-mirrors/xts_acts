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

import { beforeEach, describe, expect, it } from '@ohos/hypium';
import Utils from '../common/Utils';
import nativeFunc from 'libnativefunc.so'

export default function commonAttrsAccessibilityRoleTest() {

  describe('CommonAttrsAccessibilityRoleTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_ACCESSIBILITYROLE_0100
     * @tc.name       : testCommonAttrsAccessibilityRole001
     * @tc.desc       : testing accessibilty role for commonattrs with valid value ARKUI_NODE_CUSTOM
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsAccessibilityRole001', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAccessibilityRole001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_ACCESSIBILITYROLE_0200
     * @tc.name       : testCommonAttrsAccessibilityRole002
     * @tc.desc       : testing accessibilty role for commonattrs with valid value ARKUI_NODE_TEXT
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsAccessibilityRole002', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAccessibilityRole002()).assertEqual(0)
      done()
    })

     /*
     * @tc.number     : SUB_ARKUI_CAPI_ACCESSIBILITYGROUP_ACCESSIBILITYROLE_0300
     * @tc.name       : testCommonAttrsAccessibilityRole003
     * @tc.desc       : testing accessibilty role for commonattrs with valid value ARKUI_NODE_SPAN
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsAccessibilityRole003', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAccessibilityRole003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ACCESSIBILITYGROUP_ACCESSIBILITYROLE_0400
     * @tc.name       : testCommonAttrsAccessibilityRole004
     * @tc.desc       : testing accessibilty role for commonattrs with valid value ARKUI_NODE_IMAGE_SPAN
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsAccessibilityRole004', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAccessibilityRole004()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ACCESSIBILITYGROUP_ACCESSIBILITYROLE_0500
     * @tc.name       : testCommonAttrsAccessibilityRole005
     * @tc.desc       : testing accessibilty role for commonattrs with valid value ARKUI_NODE_IMAGE
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsAccessibilityRole005', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAccessibilityRole005()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ACCESSIBILITYGROUP_ACCESSIBILITYROLE_0600
     * @tc.name       : testCommonAttrsAccessibilityRole006
     * @tc.desc       : testing accessibilty role for commonattrs with valid value ARKUI_NODE_TOGGLE
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsAccessibilityRole006', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAccessibilityRole006()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ACCESSIBILITYGROUP_ACCESSIBILITYROLE_0700
     * @tc.name       : testCommonAttrsAccessibilityRole007
     * @tc.desc       : testing accessibilty role for commonattrs with valid value ARKUI_NODE_LOADING_PROGRESS
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsAccessibilityRole007', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAccessibilityRole007()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ACCESSIBILITYGROUP_ACCESSIBILITYROLE_0800
     * @tc.name       : testCommonAttrsAccessibilityRole008
     * @tc.desc       : testing accessibilty role for commonattrs with valid value ARKUI_NODE_TEXT_INPUT
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsAccessibilityRole008', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAccessibilityRole008()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ACCESSIBILITYGROUP_ACCESSIBILITYROLE_0900
     * @tc.name       : testCommonAttrsAccessibilityRole009
     * @tc.desc       : testing accessibilty role for commonattrs with valid value ARKUI_NODE_TEXT_AREA
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsAccessibilityRole009', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAccessibilityRole009()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ACCESSIBILITYGROUP_ACCESSIBILITYROLE_1000
     * @tc.name       : testCommonAttrsAccessibilityRole010
     * @tc.desc       : testing accessibilty role for commonattrs with valid value ARKUI_NODE_BUTTON
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsAccessibilityRole010', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAccessibilityRole010()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ACCESSIBILITYGROUP_ACCESSIBILITYROLE_1100
     * @tc.name       : testCommonAttrsAccessibilityRole011
     * @tc.desc       : testing accessibilty role for commonattrs with valid value ARKUI_NODE_PROGRESS
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsAccessibilityRole011', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAccessibilityRole011()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ACCESSIBILITYGROUP_ACCESSIBILITYROLE_1200
     * @tc.name       : testCommonAttrsAccessibilityRole012
     * @tc.desc       : testing accessibilty role for commonattrs with valid value ARKUI_NODE_CHECKBOX
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsAccessibilityRole012', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAccessibilityRole012()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ACCESSIBILITYGROUP_ACCESSIBILITYROLE_1300
     * @tc.name       : testCommonAttrsAccessibilityRole013
     * @tc.desc       : testing accessibilty role for commonattrs with valid value ARKUI_NODE_XCOMPONENT
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsAccessibilityRole013', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAccessibilityRole013()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ACCESSIBILITYGROUP_ACCESSIBILITYROLE_1400
     * @tc.name       : testCommonAttrsAccessibilityRole014
     * @tc.desc       : testing accessibilty role for commonattrs with valid value ARKUI_NODE_DATE_PICKER
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsAccessibilityRole014', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAccessibilityRole014()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ACCESSIBILITYGROUP_ACCESSIBILITYROLE_1500
     * @tc.name       : testCommonAttrsAccessibilityRole015
     * @tc.desc       : testing accessibilty role for commonattrs with valid value ARKUI_NODE_TIME_PICKER
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsAccessibilityRole015', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAccessibilityRole015()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ACCESSIBILITYGROUP_ACCESSIBILITYROLE_1600
     * @tc.name       : testCommonAttrsAccessibilityRole016
     * @tc.desc       : testing accessibilty role for commonattrs with valid value ARKUI_NODE_TIME_PICKER
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsAccessibilityRole016', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAccessibilityRole016()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ACCESSIBILITYGROUP_ACCESSIBILITYROLE_1700
     * @tc.name       : testCommonAttrsAccessibilityRole017
     * @tc.desc       : testing accessibilty role for commonattrs with valid value ARKUI_NODE_CALENDAR_PICKER
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsAccessibilityRole017', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAccessibilityRole017()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ACCESSIBILITYGROUP_ACCESSIBILITYROLE_1800
     * @tc.name       : testCommonAttrsAccessibilityRole018
     * @tc.desc       : testing accessibilty role for commonattrs with valid value ARKUI_NODE_SLIDER
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsAccessibilityRole018', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAccessibilityRole018()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ACCESSIBILITYGROUP_ACCESSIBILITYROLE_1900
     * @tc.name       : testCommonAttrsAccessibilityRole019
     * @tc.desc       : testing accessibilty role for commonattrs with valid value ARKUI_NODE_RADIO
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsAccessibilityRole019', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAccessibilityRole019()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ACCESSIBILITYGROUP_ACCESSIBILITYROLE_2000
     * @tc.name       : testCommonAttrsAccessibilityRole020
     * @tc.desc       : testing accessibilty role for commonattrs with valid value ARKUI_NODE_IMAGE_ANIMATOR
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsAccessibilityRole020', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAccessibilityRole020()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ACCESSIBILITYGROUP_ACCESSIBILITYROLE_2100
     * @tc.name       : testCommonAttrsAccessibilityRole021
     * @tc.desc       : testing accessibilty role for commonattrs with valid value ARKUI_NODE_STACK
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsAccessibilityRole021', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAccessibilityRole021()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ACCESSIBILITYGROUP_ACCESSIBILITYROLE_2200
     * @tc.name       : testCommonAttrsAccessibilityRole022
     * @tc.desc       : testing accessibilty role for commonattrs with valid value ARKUI_NODE_SWIPER
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsAccessibilityRole022', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAccessibilityRole022()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ACCESSIBILITYGROUP_ACCESSIBILITYROLE_2300
     * @tc.name       : testCommonAttrsAccessibilityRole023
     * @tc.desc       : testing accessibilty role for commonattrs with valid value ARKUI_NODE_SCROLLARKUI_NODE_SCROLL
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsAccessibilityRole023', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAccessibilityRole023()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ACCESSIBILITYGROUP_ACCESSIBILITYROLE_2400
     * @tc.name       : testCommonAttrsAccessibilityRole024
     * @tc.desc       : testing accessibilty role for commonattrs with valid value ARKUI_NODE_LIST
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsAccessibilityRole024', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAccessibilityRole024()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ACCESSIBILITYGROUP_ACCESSIBILITYROLE_2500
     * @tc.name       : testCommonAttrsAccessibilityRole025
     * @tc.desc       : testing accessibilty role for commonattrs with valid value ARKUI_NODE_LIST_ITEM
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsAccessibilityRole025', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAccessibilityRole025()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ACCESSIBILITYGROUP_ACCESSIBILITYROLE_2600
     * @tc.name       : testCommonAttrsAccessibilityRole026
     * @tc.desc       : testing accessibilty role for commonattrs with valid value  ARKUI_NODE_LIST_ITEM_GROUP
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsAccessibilityRole026', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAccessibilityRole026()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ACCESSIBILITYGROUP_ACCESSIBILITYROLE_2700
     * @tc.name       : testCommonAttrsAccessibilityRole027
     * @tc.desc       : testing accessibilty role for commonattrs with valid value ARKUI_NODE_COLUMN
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsAccessibilityRole027', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAccessibilityRole027()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ACCESSIBILITYGROUP_ACCESSIBILITYROLE_2800
     * @tc.name       : testCommonAttrsAccessibilityRole028
     * @tc.desc       : testing accessibilty role for commonattrs with valid value ARKUI_NODE_ROW
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsAccessibilityRole028', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAccessibilityRole028()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ACCESSIBILITYGROUP_ACCESSIBILITYROLE_2900
     * @tc.name       : testCommonAttrsAccessibilityRole029
     * @tc.desc       : testing accessibilty role for commonattrs with valid value ARKUI_NODE_FLEX
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsAccessibilityRole029', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAccessibilityRole029()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ACCESSIBILITYGROUP_ACCESSIBILITYROLE_3000
     * @tc.name       : testCommonAttrsAccessibilityRole030
     * @tc.desc       : testing accessibilty role for commonattrs with valid value ARKUI_NODE_REFRESH
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsAccessibilityRole030', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAccessibilityRole030()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ACCESSIBILITYGROUP_ACCESSIBILITYROLE_3100
     * @tc.name       : testCommonAttrsAccessibilityRole031
     * @tc.desc       : testing accessibilty role for commonattrs with valid value ARKUI_NODE_WATER_FLOW
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsAccessibilityRole031', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAccessibilityRole031()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ACCESSIBILITYGROUP_ACCESSIBILITYROLE_3200
     * @tc.name       : testCommonAttrsAccessibilityRole032
     * @tc.desc       : testing accessibilty role for commonattrs with valid value ARKUI_NODE_WATER_FLOW_ITEM
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsAccessibilityRole032', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAccessibilityRole032()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ACCESSIBILITYGROUP_ACCESSIBILITYROLE_3300
     * @tc.name       : testCommonAttrsAccessibilityRole033
     * @tc.desc       : testing accessibilty role for commonattrs with valid value ARKUI_NODE_RELATIVE_CONTAINER
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsAccessibilityRole033', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAccessibilityRole033()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ACCESSIBILITYGROUP_ACCESSIBILITYROLE_3400
     * @tc.name       : testCommonAttrsAccessibilityRole034
     * @tc.desc       : testing accessibilty role for commonattrs with valid value ARKUI_NODE_GRID
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsAccessibilityRole034', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAccessibilityRole034()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ACCESSIBILITYGROUP_ACCESSIBILITYROLE_3500
     * @tc.name       : testCommonAttrsAccessibilityRole035
     * @tc.desc       : testing accessibilty role for commonattrs with valid value ARKUI_NODE_GRID_ITEM
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsAccessibilityRole035', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAccessibilityRole035()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ACCESSIBILITYGROUP_ACCESSIBILITYROLE_3600
     * @tc.name       : testCommonAttrsAccessibilityRole036
     * @tc.desc       : testing accessibilty role for commonattrs with valid value ARKUI_NODE_CUSTOM_SPAN
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsAccessibilityRole036', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAccessibilityRole036()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ACCESSIBILITYGROUP_ACCESSIBILITYROLE_3700
     * @tc.name       : testCommonAttrsAccessibilityRole037
     * @tc.desc       : testing accessibilty role for commonattrs with invalid value -1
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsAccessibilityRole037', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAccessibilityRole037()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ACCESSIBILITYGROUP_ACCESSIBILITYROLE_3800
     * @tc.name       : testCommonAttrsAccessibilityRole038
     * @tc.desc       : testing accessibilty role for commonattrs with invalid value 20
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsAccessibilityRole038', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAccessibilityRole038()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ACCESSIBILITYGROUP_ACCESSIBILITYROLE_3900
     * @tc.name       : testCommonAttrsAccessibilityRole039
     * @tc.desc       : testing accessibilty role for commonattrs with invalid value 999
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsAccessibilityRole039', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAccessibilityRole039()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ACCESSIBILITYGROUP_ACCESSIBILITYROLE_4000
     * @tc.name       : testCommonAttrsAccessibilityRole040
     * @tc.desc       : testing accessibilty role for commonattrs with invalid value 1016
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsAccessibilityRole040', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAccessibilityRole040()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ACCESSIBILITYGROUP_ACCESSIBILITYROLE_4100
     * @tc.name       : testCommonAttrsAccessibilityRole041
     * @tc.desc       : testing accessibilty role for commonattrs with valid value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsAccessibilityRole041', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAccessibilityRole041()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ACCESSIBILITYGROUP_ACCESSIBILITYROLE_4200
     * @tc.name       : testCommonAttrsAccessibilityRole042
     * @tc.desc       : testing resetAttribute accessibilty role for commonattrs
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsAccessibilityRole042', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAccessibilityRole042()).assertEqual(0)
      done()
    })
  })
}

