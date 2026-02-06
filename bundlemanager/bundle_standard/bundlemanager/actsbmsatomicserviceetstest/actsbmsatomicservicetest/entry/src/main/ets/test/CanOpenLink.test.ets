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
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or impligetProfileByAbilityEmptyAbilityCalled.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import bundle from '@ohos.bundle.bundleManager';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from "@ohos/hypium"

const PARAM_ERROR_CODE = 401;
const ERROR_SCHEME_NOT_IN_QUERYSCHEMES = 17700056;
const ERROR_INVALID_LINK = 17700055;

export default function canOpenLink() {
  describe('canOpenLink', () => {

    /**
     * @tc.name   canOpenLinkCanOpen
     * @tc.number SUB_BMS_CANOPENLINK_0010
     * @tc.desc   Test canOpenLink, return true.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('canOpenLinkCanOpen', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: Function) => {
      try {
        let data = bundle.canOpenLink("http://");
        expect(data).assertTrue();
        done();
      } catch (err) {
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   canOpenLinkCanNotOpen
     * @tc.number SUB_BMS_CANOPENLINK_0020
     * @tc.desc   Test canOpenLink, return false.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('canOpenLinkCanNotOpen', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: Function) => {
      try {
        let data = bundle.canOpenLink("welink://");
        expect(data).assertFalse();
        done();
      } catch (err) {
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   canOpenLinkNotInQuerySchemes
     * @tc.number SUB_BMS_CANOPENLINK_0030
     * @tc.desc   The scheme of the specified link is not in the querySchemes.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('canOpenLinkNotInQuerySchemes', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: Function) => {
      try {
        let data = bundle.canOpenLink("https://");
        expect(data).assertFail();
        done();
      } catch (err) {
        expect(err.code).assertEqual(ERROR_SCHEME_NOT_IN_QUERYSCHEMES);
        done();
      }
    });

    /**
     * @tc.name   canOpenLinkInvalidLink
     * @tc.number SUB_BMS_CANOPENLINK_0040
     * @tc.desc   The specified link is invalid.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('canOpenLinkInvalidLink', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: Function) => {
      try {
        let data = bundle.canOpenLink("http:/");
        expect(data).assertFail();
        done();
      } catch (err) {
        expect(err.code).assertEqual(ERROR_INVALID_LINK);
        done();
      }
    });

    /**
     * @tc.name   canOpenLinkNullType
     * @tc.number SUB_BMS_CANOPENLINK_0050
     * @tc.desc   The parameter type is incorrect.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('canOpenLinkNullType', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: Function) => {
      try {
        let data = bundle.canOpenLink(null);
        expect(data).assertFail();
        done();
      } catch (err) {
        expect(err.code).assertEqual(PARAM_ERROR_CODE);
        done();
      }
    });

    /**
     * @tc.name   canOpenLinkUndefinedType
     * @tc.number SUB_BMS_CANOPENLINK_0060
     * @tc.desc   The parameter type is incorrect.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('canOpenLinkUndefinedType', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: Function) => {
      try {
        let data = bundle.canOpenLink(undefined);
        expect(data).assertFail();
        done();
      } catch (err) {
        expect(err.code).assertEqual(PARAM_ERROR_CODE);
        done();
      }
    });

    /**
     * @tc.name   canOpenLinkEmptyParam
     * @tc.number SUB_BMS_CANOPENLINK_0070
     * @tc.desc   The parameter is incorrect.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('canOpenLinkEmptyParam', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: Function) => {
      try {
        let data = bundle.canOpenLink("");
        expect(data).assertFail();
        done();
      } catch (err) {
        expect(err.code).assertEqual(ERROR_INVALID_LINK);
        done();
      }
    });

    /**
     * @tc.name   canOpenLinkLowercaseParam
     * @tc.number SUB_BMS_CANOPENLINK_0080
     * @tc.desc   The parameter is lowercase letter when configure is capital letter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('canOpenLinkLowercaseParam', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: Function) => {
      try {
        let data = bundle.canOpenLink("scheme://com.ohos.test");
        expect(data).assertTrue();
        done();
      } catch (err) {
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   canOpenLinkSchemeMatch
     * @tc.number SUB_BMS_CANOPENLINK_0090
     * @tc.desc   Test canOpenLink when scheme match.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('canOpenLinkSchemeMatch', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      try {
        let data = bundle.canOpenLink("matchscheme1://com.ohos.test");
        expect(data).assertTrue();
        done();
      } catch (err) {
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   canOpenLinkHostMatch
     * @tc.number SUB_BMS_CANOPENLINK_0010
     * @tc.desc   Test canOpenLink when host match.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('canOpenLinkHostMatch', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      try {
        let data = bundle.canOpenLink("matchscheme2://com.ohos.test:8080");
        expect(data).assertTrue();
        done();
      } catch (err) {
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   canOpenLinkPortMatch
     * @tc.number SUB_BMS_CANOPENLINK_0011
     * @tc.desc   Test canOpenLink when port match.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('canOpenLinkPortMatch', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      try {
        let data = bundle.canOpenLink("Matchscheme3://com.ohos.test:8080/hello");
        expect(data).assertTrue();
        done();
      } catch (err) {
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   canOpenLinkHostNotMatch
     * @tc.number SUB_BMS_CANOPENLINK_0012
     * @tc.desc   Test canOpenLink when host not match.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('canOpenLinkHostNotMatch', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: Function) => {
      try {
        let data = bundle.canOpenLink("Matchscheme3://host.ohos.test:8080");
        expect(data).assertFalse();
        done();
      } catch (err) {
        expect().assertFail();
        done();
      }
    });
  })
}