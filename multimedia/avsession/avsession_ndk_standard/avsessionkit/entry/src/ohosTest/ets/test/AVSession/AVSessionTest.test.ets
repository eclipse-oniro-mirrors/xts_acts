/*
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium'
import libavsession from 'libavsession.so'

const OS_ACCOUNT_ERR_OK = 0;

export default function AVSessionTest() {
  describe('AVSessionTest', () => {
    /**
     * @tc.number   SUB_AVSession_AVMetadataErrorCode_001
     * @tc.name     testAVSessionAVMetadataErrorCode001
     * @tc.desc     testing OH_ArkUI_CustomSpanMetrics_SetWidth interface.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVSessionAVMetadataErrorCode001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVMetadataErrorCode1();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionAVMetadataErrorCode1001 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number   SUB_AVSession_AVMetadataSkipIntervals_001
     * @tc.name     testAVSessionAVMetadataSkipIntervals001
     * @tc.desc     testing OH_ArkUI_CustomSpanMetrics_SetWidth interface.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVSessionAVMetadataSkipIntervals001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVMetadataSkipIntervals(10);
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>SUB_ArkUI_ACE_CustomSpanMetricsTest_0100 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number   SUB_AVSession_AVMetadataSkipIntervals_002
     * @tc.name     testAVSessionAVMetadataSkipIntervals002
     * @tc.desc     testing OH_ArkUI_CustomSpanMetrics_SetWidth interface.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVSessionAVMetadataSkipIntervals002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVMetadataSkipIntervals(15);
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionAVMetadataSkipIntervals002 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number   SUB_AVSession_AVMetadataSkipIntervals_003
     * @tc.name     testAVSessionAVMetadataSkipIntervals003
     * @tc.desc     testing OH_ArkUI_CustomSpanMetrics_SetWidth interface.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVSessionAVMetadataSkipIntervals003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVMetadataSkipIntervals(30);
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionAVMetadataSkipIntervals003 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number   SUB_AVSession_AVMetadataBuilderCreate_001
     * @tc.name     testAVSessionAVMetadataBuilderCreate001
     * @tc.desc     testing OH_ArkUI_CustomSpanMetrics_SetWidth interface.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVSessionAVMetadataBuilderCreate001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVMetadataBuilderCreateSuccess();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionAVMetadataBuilderCreate001 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number   SUB_AVSession_AVMetadataBuilderCreate_002
     * @tc.name     testAVSessionAVMetadataBuilderCreate002
     * @tc.desc     testing OH_ArkUI_CustomSpanMetrics_SetWidth interface.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVSessionAVMetadataBuilderCreate002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVMetadataBuilderCreateInvalidParam();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionAVMetadataBuilderCreate002 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number   SUB_AVSession_AVMetadataBuilderDestroy_001
     * @tc.name     testAVSessionAVMetadataBuilderDestroy001
     * @tc.desc     testing OH_ArkUI_CustomSpanMetrics_SetWidth interface.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVSessionAVMetadataBuilderDestroy001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVMetadataBuilderDestroyInvalidSuccess();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionAVMetadataBuilderDestroy001 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number   SUB_AVSession_AVMetadataBuilderDestroy_002
     * @tc.name     testAVSessionAVMetadataBuilderDestroy002
     * @tc.desc     testing OH_ArkUI_CustomSpanMetrics_SetWidth interface.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVSessionAVMetadataBuilderDestroy002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVMetadataBuilderDestroyInvalidParam();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionAVMetadataBuilderDestroy002 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number   SUB_AVSession_AVMetadataBuilderSetAssetId_001
     * @tc.name     testAVSessionAVMetadataBuilderSetAssetId001
     * @tc.desc     testing OH_ArkUI_CustomSpanMetrics_SetWidth interface.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVSessionAVMetadataBuilderSetAssetId001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVMetadataBuilderSetAssetIdSuccess();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionAVMetadataBuilderSetAssetId001 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number   SUB_AVSession_AVMetadataBuilderSetAssetId_002
     * @tc.name     testAVSessionAVMetadataBuilderSetAssetId002
     * @tc.desc     testing OH_ArkUI_CustomSpanMetrics_SetWidth interface.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVSessionAVMetadataBuilderSetAssetId002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVMetadataBuilderSetAssetIdInvalidParam();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionAVMetadataBuilderSetAssetId002 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number   SUB_AVSession_AVMetadataBuilderSetTitle_001
     * @tc.name     testAVSessionAVMetadataBuilderSetTitle001
     * @tc.desc     testing OH_ArkUI_CustomSpanMetrics_SetWidth interface.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVSessionAVMetadataBuilderSetTitle001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVMetadataBuilderSetTitleSuccess();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionAVMetadataBuilderSetTitle001 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number   SUB_AVSession_AVMetadataBuilderSetTitle_002
     * @tc.name     testAVSessionAVMetadataBuilderSetTitle002
     * @tc.desc     testing OH_ArkUI_CustomSpanMetrics_SetWidth interface.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVSessionAVMetadataBuilderSetTitle002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVMetadataBuilderSetTitleInvalidParam();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionAVMetadataBuilderSetTitle002 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number   SUB_AVSession_AVMetadataBuilderSetArtist_001
     * @tc.name     testAVSessionAVMetadataBuilderSetArtist001
     * @tc.desc     testing OH_ArkUI_CustomSpanMetrics_SetWidth interface.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVSessionAVMetadataBuilderSetArtist001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVMetadataBuilderSetArtistSuccess();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionAVMetadataBuilderSetArtist001 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number   SUB_AVSession_AVMetadataBuilderSetArtist_002
     * @tc.name     testAVSessionAVMetadataBuilderSetArtist002
     * @tc.desc     testing OH_ArkUI_CustomSpanMetrics_SetWidth interface.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVSessionAVMetadataBuilderSetArtist002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVMetadataBuilderSetArtistInvalidParam();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionAVMetadataBuilderSetArtist002 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number   SUB_AVSession_AVMetadataBuilderSetAuthor_001
     * @tc.name     testAVSessionAVMetadataBuilderSetAuthor001
     * @tc.desc     testing OH_ArkUI_CustomSpanMetrics_SetWidth interface.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVSessionAVMetadataBuilderSetAuthor001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVMetadataBuilderSetAuthorSuccess();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionAVMetadataBuilderSetAuthor001 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number   SUB_AVSession_AVMetadataBuilderSetAuthor_002
     * @tc.name     testAVSessionAVMetadataBuilderSetAuthor002
     * @tc.desc     testing OH_ArkUI_CustomSpanMetrics_SetWidth interface.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVSessionAVMetadataBuilderSetAuthor002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVMetadataBuilderSetAuthorInvalidParam();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionAVMetadataBuilderSetAuthor002 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number   SUB_AVSession_AVMetadataBuilderSetAlbum_001
     * @tc.name     testAVSessionAVMetadataBuilderSetAlbum001
     * @tc.desc     testing OH_ArkUI_CustomSpanMetrics_SetWidth interface.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVSessionAVMetadataBuilderSetAlbum001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVMetadataBuilderSetAlbumSuccess();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionAVMetadataBuilderSetAlbum001 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number   SUB_AVSession_AVMetadataBuilderSetAlbum_002
     * @tc.name     testAVSessionAVMetadataBuilderSetAlbum002
     * @tc.desc     testing OH_ArkUI_CustomSpanMetrics_SetWidth interface.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVSessionAVMetadataBuilderSetAlbum002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVMetadataBuilderSetAlbumInvalidParam();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionAVMetadataBuilderSetAlbum002 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number   SUB_AVSession_AVMetadataBuilderSetWriter_001
     * @tc.name     testAVSessionAVMetadataBuilderSetWriter001
     * @tc.desc     testing OH_ArkUI_CustomSpanMetrics_SetWidth interface.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVSessionAVMetadataBuilderSetWriter001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVMetadataBuilderSetWriterSuccess();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionAVMetadataBuilderSetWriter001 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number   SUB_AVSession_AVMetadataBuilderSetWriter_002
     * @tc.name     testAVSessionAVMetadataBuilderSetWriter002
     * @tc.desc     testing OH_ArkUI_CustomSpanMetrics_SetWidth interface.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVSessionAVMetadataBuilderSetWriter002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVMetadataBuilderSetWriterInvalidParam();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionAVMetadataBuilderSetAlbum002 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number   SUB_AVSession_AVMetadataBuilderSetComposer_001
     * @tc.name     testAVSessionAVMetadataBuilderSetComposer001
     * @tc.desc     testing OH_ArkUI_CustomSpanMetrics_SetWidth interface.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVSessionAVMetadataBuilderSetComposer001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVMetadataBuilderSetComposerSuccess();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionAVMetadataBuilderSetComposer001 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number   SUB_AVSession_AVMetadataBuilderSetComposer_002
     * @tc.name     testAVSessionAVMetadataBuilderSetComposer002
     * @tc.desc     testing OH_ArkUI_CustomSpanMetrics_SetWidth interface.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVSessionAVMetadataBuilderSetComposer002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVMetadataBuilderSetComposerInvalidParam();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionAVMetadataBuilderSetComposer002 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number   SUB_AVSession_AVMetadataBuilderSetDuration_001
     * @tc.name     testAVSessionAVMetadataBuilderSetDuration001
     * @tc.desc     testing OH_ArkUI_CustomSpanMetrics_SetWidth interface.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVSessionAVMetadataBuilderSetDuration001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVMetadataBuilderSetDurationSuccess();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionAVMetadataBuilderSetDuration001 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number   SUB_AVSession_AVMetadataBuilderSetDuration_002
     * @tc.name     testAVSessionAVMetadataBuilderSetDuration002
     * @tc.desc     testing OH_ArkUI_CustomSpanMetrics_SetWidth interface.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVSessionAVMetadataBuilderSetDuration002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVMetadataBuilderSetDurationInvalidParam();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionAVMetadataBuilderSetDuration002 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number   SUB_AVSession_AVMetadataBuilderSetMediaImageUri_001
     * @tc.name     testAVSessionAVMetadataBuilderSetMediaImageUri001
     * @tc.desc     testing OH_ArkUI_CustomSpanMetrics_SetWidth interface.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVSessionAVMetadataBuilderSetMediaImageUri001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVMetadataBuilderSetMediaImageUriSuccess();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionAVMetadataBuilderSetMediaImageUri001 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number   SUB_AVSession_AVMetadataBuilderSetMediaImageUri_002
     * @tc.name     testAVSessionAVMetadataBuilderSetMediaImageUri002
     * @tc.desc     testing OH_ArkUI_CustomSpanMetrics_SetWidth interface.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVSessionAVMetadataBuilderSetMediaImageUri002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVMetadataBuilderSetMediaImageUriInvalidParam();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionAVMetadataBuilderSetMediaImageUri002 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number   SUB_AVSession_AVMetadataBuilderSetSubtitle_001
     * @tc.name     testAVSessionAVMetadataBuilderSetSubtitle001
     * @tc.desc     testing OH_ArkUI_CustomSpanMetrics_SetWidth interface.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVSessionAVMetadataBuilderSetSubtitle001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVMetadataBuilderSetSubtitleSuccess();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionAVMetadataBuilderSetSubtitle001 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number   SUB_AVSession_AVMetadataBuilderSetSubtitle_002
     * @tc.name     testAVSessionAVMetadataBuilderSetSubtitle002
     * @tc.desc     testing OH_ArkUI_CustomSpanMetrics_SetWidth interface.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVSessionAVMetadataBuilderSetSubtitle002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVMetadataBuilderSetSubtitleInvalidParam();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionAVMetadataBuilderSetSubtitle002 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number   SUB_AVSession_AVMetadataBuilderSetDescription_001
     * @tc.name     testAVSessionAVMetadataBuilderSetDescription001
     * @tc.desc     testing OH_ArkUI_CustomSpanMetrics_SetWidth interface.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVSessionAVMetadataBuilderSetDescription001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVMetadataBuilderSetDescriptionSuccess();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionAVMetadataBuilderSetDescription001 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number   SUB_AVSession_AVMetadataBuilderSetDescription_002
     * @tc.name     testAVSessionAVMetadataBuilderSetDescription002
     * @tc.desc     testing OH_ArkUI_CustomSpanMetrics_SetWidth interface.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVSessionAVMetadataBuilderSetDescription002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVMetadataBuilderSetDescriptionInvalidParam();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionAVMetadataBuilderSetDescription002 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number   SUB_AVSession_AVMetadataBuilderSetLyric_001
     * @tc.name     testAVSessionAVMetadataBuilderSetLyric001
     * @tc.desc     testing OH_ArkUI_CustomSpanMetrics_SetWidth interface.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVSessionAVMetadataBuilderSetLyric001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVMetadataBuilderSetLyricSuccess();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionAVMetadataBuilderSetLyric001 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number   SUB_AVSession_AVMetadataBuilderSetLyric_002
     * @tc.name     testAVSessionAVMetadataBuilderSetLyric002
     * @tc.desc     testing OH_ArkUI_CustomSpanMetrics_SetWidth interface.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVSessionAVMetadataBuilderSetLyric002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVMetadataBuilderSetLyricInvalidParam();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionAVMetadataBuilderSetLyric002 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number   SUB_AVSession_AVMetadataBuilderSetSkipIntervals_001
     * @tc.name     testAVMetadataBuilderSetSkipIntervals001
     * @tc.desc     testing OH_ArkUI_CustomSpanMetrics_SetWidth interface.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVMetadataBuilderSetSkipIntervals001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVMetadataBuilderSetSkipIntervalsSuccess(10);
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVMetadataBuilderSetSkipIntervals001 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number   SUB_AVSession_AVMetadataBuilderSetSkipIntervals_002
     * @tc.name     testAVMetadataBuilderSetSkipIntervals002
     * @tc.desc     testing OH_ArkUI_CustomSpanMetrics_SetWidth interface.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVMetadataBuilderSetSkipIntervals002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVMetadataBuilderSetSkipIntervalsInvalidParam(50);
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVMetadataBuilderSetSkipIntervals002 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number   SUB_AVSession_AVMetadataBuilderSetDisplayTags_001
     * @tc.name     testAVSessionAVMetadataBuilderSetDisplayTags001
     * @tc.desc     testing OH_ArkUI_CustomSpanMetrics_SetWidth interface.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVSessionAVMetadataBuilderSetDisplayTags001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVMetadataBuilderSetDisplayTagsSuccess();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionAVMetadataBuilderSetDisplayTags001 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number   SUB_AVSession_AVMetadataBuilderSetDisplayTags_002
     * @tc.name     testAVSessionAVMetadataBuilderSetDisplayTags002
     * @tc.desc     testing OH_ArkUI_CustomSpanMetrics_SetWidth interface.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVSessionAVMetadataBuilderSetDisplayTags002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVMetadataBuilderSetDisplayTagsInvalidParam();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionAVMetadataBuilderSetDisplayTags002 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number   SUB_AVSession_AVMetadataBuilderGenerateAVMetadata_001
     * @tc.name     testAVSessionAVMetadataBuilderGenerateAVMetadata001
     * @tc.desc     testing OH_ArkUI_CustomSpanMetrics_SetWidth interface.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVSessionAVMetadataBuilderGenerateAVMetadata001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVMetadataBuilderGenerateAVMetadataSuccess();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionAVMetadataBuilderGenerateAVMetadata001 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number   SUB_AVSession_AVMetadataBuilderGenerateAVMetadata_002
     * @tc.name     testAVSessionAVMetadataBuilderGenerateAVMetadata002
     * @tc.desc     testing OH_ArkUI_CustomSpanMetrics_SetWidth interface.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVSessionAVMetadataBuilderGenerateAVMetadata002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVMetadataBuilderGenerateAVMetadataInvalidParam();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionAVMetadataBuilderGenerateAVMetadata002 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number   SUB_AVSession_AVMetadataDestroy_001
     * @tc.name     testAVSessionAVMetadataDestroy001
     * @tc.desc     testing OH_ArkUI_CustomSpanMetrics_SetWidth interface.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVSessionAVMetadataDestroy001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVMetadataDestroySuccess();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionAVMetadataDestroy001 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number   SUB_AVSession_AVMetadataDestroy_002
     * @tc.name     testAVSessionAVMetadataDestroy002
     * @tc.desc     testing OH_ArkUI_CustomSpanMetrics_SetWidth interface.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVSessionAVMetadataDestroy002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVMetadataDestroyInvalidParam();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionAVMetadataDestroy002 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number   SUB_AVSession_AVMetadataAVSessionType_001
     * @tc.name     testAVSessionAVMetadataAVSessionType001
     * @tc.desc     testing OH_ArkUI_CustomSpanMetrics_SetWidth interface.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVSessionAVMetadataAVSessionType001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVMetadataAVSessionType(0);
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionAVMetadataAVSessionType001 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number   SUB_AVSession_AVMetadataAVSessionType_002
     * @tc.name     testAVSessionAVMetadataAVSessionType002
     * @tc.desc     testing OH_ArkUI_CustomSpanMetrics_SetWidth interface.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVSessionAVMetadataAVSessionType002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVMetadataAVSessionType(1);
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionAVMetadataAVSessionType002 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number   SUB_AVSession_AVMetadataAVSessionType_003
     * @tc.name     testAVSessionAVMetadataAVSessionType003
     * @tc.desc     testing OH_ArkUI_CustomSpanMetrics_SetWidth interface.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVSessionAVMetadataAVSessionType003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVMetadataAVSessionType(3);
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionAVMetadataAVSessionType003 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number   SUB_AVSession_AVMetadataAVSetPlaybackState_001
     * @tc.name     testAVSessionAVMetadataAVSetPlaybackState001
     * @tc.desc     testing OH_ArkUI_CustomSpanMetrics_SetWidth interface.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVSessionAVMetadataAVSetPlaybackState001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVMetadataAVSetPlaybackState(0);
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionAVMetadataAVSetPlaybackState001 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number   SUB_AVSession_AVMetadataAVSetPlaybackState_002
     * @tc.name     testAVSessionAVMetadataAVSetPlaybackState002
     * @tc.desc     testing OH_ArkUI_CustomSpanMetrics_SetWidth interface.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVSessionAVMetadataAVSetPlaybackState002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVMetadataAVSetPlaybackState(1);
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionAVMetadataAVSetPlaybackState002 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number   SUB_AVSession_AVMetadataAVSetPlaybackState_003
     * @tc.name     testAVSessionAVMetadataAVSetPlaybackState003
     * @tc.desc     testing OH_ArkUI_CustomSpanMetrics_SetWidth interface.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVSessionAVMetadataAVSetPlaybackState003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVMetadataAVSetPlaybackState(2);
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionAVMetadataAVSetPlaybackState003 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number   SUB_AVSession_AVMetadataAVSetPlaybackState_004
     * @tc.name     testAVSessionAVMetadataAVSetPlaybackState004
     * @tc.desc     testing OH_ArkUI_CustomSpanMetrics_SetWidth interface.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVSessionAVMetadataAVSetPlaybackState004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVMetadataAVSetPlaybackState(3);
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionAVMetadataAVSetPlaybackState004 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number   SUB_AVSession_AVMetadataAVSetPlaybackState_005
     * @tc.name     testAVSessionAVMetadataAVSetPlaybackState005
     * @tc.desc     testing OH_ArkUI_CustomSpanMetrics_SetWidth interface.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVSessionAVMetadataAVSetPlaybackState005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVMetadataAVSetPlaybackState(4);
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionAVMetadataAVSetPlaybackState005 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number   SUB_AVSession_AVMetadataAVSetPlaybackState_006
     * @tc.name     testAVSessionAVMetadataAVSetPlaybackState006
     * @tc.desc     testing OH_ArkUI_CustomSpanMetrics_SetWidth interface.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVSessionAVMetadataAVSetPlaybackState006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVMetadataAVSetPlaybackState(5);
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionAVMetadataAVSetPlaybackState006 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number   SUB_AVSession_AVMetadataAVSetPlaybackState_007
     * @tc.name     testAVSessionAVMetadataAVSetPlaybackState007
     * @tc.desc     testing OH_ArkUI_CustomSpanMetrics_SetWidth interface.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVSessionAVMetadataAVSetPlaybackState007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVMetadataAVSetPlaybackState(6);
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionAVMetadataAVSetPlaybackState007 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number   SUB_AVSession_AVMetadataAVSetPlaybackState_008
     * @tc.name     testAVSessionAVMetadataAVSetPlaybackState008
     * @tc.desc     testing OH_ArkUI_CustomSpanMetrics_SetWidth interface.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVSessionAVMetadataAVSetPlaybackState008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVMetadataAVSetPlaybackState(7);
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionAVMetadataAVSetPlaybackState008 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number   SUB_AVSession_AVMetadataAVSetPlaybackState_009
     * @tc.name     testAVSessionAVMetadataAVSetPlaybackState009
     * @tc.desc     testing OH_ArkUI_CustomSpanMetrics_SetWidth interface.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVSessionAVMetadataAVSetPlaybackState009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVMetadataAVSetPlaybackState(8);
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionAVMetadataAVSetPlaybackState009 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number   SUB_AVSession_AVMetadataAVSetPlaybackState_010
     * @tc.name     testAVSessionAVMetadataAVSetPlaybackState010
     * @tc.desc     testing OH_ArkUI_CustomSpanMetrics_SetWidth interface.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVSessionAVMetadataAVSetPlaybackState010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVMetadataAVSetPlaybackState(9);
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionAVMetadataAVSetPlaybackState010 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number   SUB_AVSession_AVMetadataAVSetPlaybackState_011
     * @tc.name     testAVSessionAVMetadataAVSetPlaybackState011
     * @tc.desc     testing OH_ArkUI_CustomSpanMetrics_SetWidth interface.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVSessionAVMetadataAVSetPlaybackState011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVMetadataAVSetPlaybackState(10);
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionAVMetadataAVSetPlaybackState011 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number   SUB_AVSession_AVMetadataAVSetPlaybackState_012
     * @tc.name     testAVSessionAVMetadataAVSetPlaybackState012
     * @tc.desc     testing OH_ArkUI_CustomSpanMetrics_SetWidth interface.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVSessionAVMetadataAVSetPlaybackState012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVMetadataAVSetPlaybackState(11);
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionAVMetadataAVSetPlaybackState012 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number   SUB_AVSession_AVMetadataAVSetPlaybackState_013
     * @tc.name     testAVSessionAVMetadataAVSetPlaybackState013
     * @tc.desc     testing OH_ArkUI_CustomSpanMetrics_SetWidth interface.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVSessionAVMetadataAVSetPlaybackState013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVMetadataAVSetPlaybackState(12);
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionAVMetadataAVSetPlaybackState013 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number   SUB_AVSession_LoopMode_001
     * @tc.name     testAVSessionLoopMode001
     * @tc.desc     testing OH_ArkUI_CustomSpanMetrics_SetWidth interface.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVSessionLoopMode001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVMetadataAVSessionLoopMode(0);
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionLoopMode001 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number   SUB_AVSession_LoopMode_002
     * @tc.name     testAVSessionLoopMode002
     * @tc.desc     testing OH_ArkUI_CustomSpanMetrics_SetWidth interface.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVSessionLoopMode002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVMetadataAVSessionLoopMode(1);
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionLoopMode002 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number   SUB_AVSession_LoopMode_003
     * @tc.name     testAVSessionLoopMode003
     * @tc.desc     testing OH_ArkUI_CustomSpanMetrics_SetWidth interface.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVSessionLoopMode003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVMetadataAVSessionLoopMode(2);
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionLoopMode003 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number   SUB_AVSession_LoopMode_004
     * @tc.name     testAVSessionLoopMode004
     * @tc.desc     testing OH_ArkUI_CustomSpanMetrics_SetWidth interface.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVSessionLoopMode004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVMetadataAVSessionLoopMode(3);
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionLoopMode004 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number   SUB_AVSession_LoopMode_005
     * @tc.name     testAVSessionLoopMode005
     * @tc.desc     testing OH_ArkUI_CustomSpanMetrics_SetWidth interface.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVSessionLoopMode005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVMetadataAVSessionLoopMode(4);
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionLoopMode005 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number   SUB_AVSession_AVMetadataAVSessionControlCommand_001
     * @tc.name     testAVSessionAVMetadataAVSessionControlCommand001
     * @tc.desc     testing OH_ArkUI_CustomSpanMetrics_SetWidth interface.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVSessionAVMetadataAVSessionControlCommand001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVMetadataAVSessionControlCommand(-1);
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAVSessionAVMetadataAVSessionControlCommand001 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number   SUB_AVSession_AVMetadataAVSessionControlCommand_002
     * @tc.name     testAVSessionAVMetadataAVSessionControlCommand002
     * @tc.desc     testing OH_ArkUI_CustomSpanMetrics_SetWidth interface.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVSessionAVMetadataAVSessionControlCommand002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVMetadataAVSessionControlCommand(1);
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionAVMetadataAVSessionControlCommand002 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number   SUB_AVSession_AVMetadataAVSessionControlCommand_003
     * @tc.name     testAVSessionAVMetadataAVSessionControlCommand003
     * @tc.desc     testing OH_ArkUI_CustomSpanMetrics_SetWidth interface.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVSessionAVMetadataAVSessionControlCommand003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVMetadataAVSessionControlCommand(2);
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionAVMetadataAVSessionControlCommand003 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number   SUB_AVSession_AVMetadataAVSessionControlCommand_004
     * @tc.name     testAVSessionAVMetadataAVSessionControlCommand004
     * @tc.desc     testing OH_ArkUI_CustomSpanMetrics_SetWidth interface.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVSessionAVMetadataAVSessionControlCommand004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVMetadataAVSessionControlCommand(3);
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionAVMetadataAVSessionControlCommand004 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number   SUB_AVSession_AVMetadataAVSessionControlCommand_005
     * @tc.name     testAVSessionAVMetadataAVSessionControlCommand005
     * @tc.desc     testing OH_ArkUI_CustomSpanMetrics_SetWidth interface.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVSessionAVMetadataAVSessionControlCommand005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVMetadataAVSessionControlCommand(4);
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionAVMetadataAVSessionControlCommand005 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number   SUB_AVSession_CallbackResultFailure_001
     * @tc.name     testAVSessionCallbackResultFailure001
     * @tc.desc     testing OH_ArkUI_CustomSpanMetrics_SetWidth interface.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVSessionCallbackResultFailure001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVSessionCallbackResultFailure();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionCallbackResultFailure001 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number   SUB_AVSession_Create_001
     * @tc.name     testAVSessionCreate001
     * @tc.desc     testing OH_ArkUI_CustomSpanMetrics_SetWidth interface.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVSessionCreate001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVSessionCreateSuccess();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionCreate001 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number   SUB_AVSession_Create_002
     * @tc.name     testAVSessionCreate002
     * @tc.desc     testing OH_ArkUI_CustomSpanMetrics_SetWidth interface.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVSessionCreate002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVSessionCreateInvalidParam();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionCreate002 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number   SUB_AVSession_Destroy_001
     * @tc.name     testAVSessionDestroy001
     * @tc.desc     testing OH_ArkUI_CustomSpanMetrics_SetWidth interface.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVSessionDestroy001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVSessionDestroySuccess();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionDestroy001 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number   SUB_AVSession_Destroy_002
     * @tc.name     testAVSessionDestroy002
     * @tc.desc     testing OH_ArkUI_CustomSpanMetrics_SetWidth interface.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVSessionDestroy002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVSessionDestroySuccess();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionDestroy002 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number   SUB_AVSession_Activate_001
     * @tc.name     testAVSessionActivate001
     * @tc.desc     testing OH_ArkUI_CustomSpanMetrics_SetWidth interface.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVSessionActivate001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVSessionActivateSuccess();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionActivate001 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number   SUB_AVSession_Activate_002
     * @tc.name     testAVSessionActivate002
     * @tc.desc     testing OH_ArkUI_CustomSpanMetrics_SetWidth interface.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVSessionActivate002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVSessionActivateInvalidParam();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionActivate002 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number   SUB_AVSession_Deactivate_001
     * @tc.name     testAVSessionDeactivate001
     * @tc.desc     testing OH_ArkUI_CustomSpanMetrics_SetWidth interface.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVSessionDeactivate001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVSessionDeactivateSuccess();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionDeactivate001 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number   SUB_AVSession_Deactivate_002
     * @tc.name     testAVSessionDeactivate002
     * @tc.desc     testing OH_ArkUI_CustomSpanMetrics_SetWidth interface.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVSessionDeactivate002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVSessionDeactivateInvalidParam();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionDeactivate002 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number   SUB_AVSession_GetSessionType_001
     * @tc.name     testAVSessionGetSessionType001
     * @tc.desc     testing OH_ArkUI_CustomSpanMetrics_SetWidth interface.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVSessionGetSessionType001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVSessionGetSessionTypeSuccess();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionGetSessionType001 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number   SUB_AVSession_GetSessionType_002
     * @tc.name     testAVSessionGetSessionType002
     * @tc.desc     testing OH_ArkUI_CustomSpanMetrics_SetWidth interface.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVSessionGetSessionType002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVSessionGetSessionTypeInvalidParam();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionGetSessionType002 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number   SUB_AVSession_GetSessionId_001
     * @tc.name     testAVSessionGetSessionId001
     * @tc.desc     testing OH_ArkUI_CustomSpanMetrics_SetWidth interface.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVSessionGetSessionId001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVSessionGetSessionIdSuccess();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionGetSessionId001 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number   SUB_AVSession_GetSessionId_002
     * @tc.name     testAVSessionGetSessionId002
     * @tc.desc     testing OH_ArkUI_CustomSpanMetrics_SetWidth interface.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVSessionGetSessionId002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVSessionGetSessionIdInvalidParam();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionGetSessionId002 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number   SUB_AVSession_PlaybackState_001
     * @tc.name     testAVSessionPlaybackState001
     * @tc.desc     testing OH_ArkUI_CustomSpanMetrics_SetWidth interface.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVSessionPlaybackState001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVSessionSetPlaybackStateSuccess();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionPlaybackState001 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number   SUB_AVSession_PlaybackState_002
     * @tc.name     testAVSessionPlaybackState002
     * @tc.desc     testing OH_ArkUI_CustomSpanMetrics_SetWidth interface.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVSessionPlaybackState002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVSessionSetPlaybackStateInvalidParam();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionPlaybackState002 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number   SUB_AVSession_SetAVMetadata_002
     * @tc.name     testAVSessionSetAVMetadata002
     * @tc.desc     testing OH_ArkUI_CustomSpanMetrics_SetWidth interface.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVSessionSetAVMetadata002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVSessionSetAVMetadataInvalidParam();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionSetAVMetadata002 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number   SUB_AVSession_SetAVMetadata_003
     * @tc.name     testAVSessionSetAVMetadata003
     * @tc.desc     testing OH_ArkUI_CustomSpanMetrics_SetWidth interface.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVSessionSetAVMetadata003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVSessionSetAVMetadataException();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionSetAVMetadata003 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number   SUB_AVSession_SetPlaybackPosition_001
     * @tc.name     testAVSessionSetPlaybackPosition001
     * @tc.desc     testing OH_ArkUI_CustomSpanMetrics_SetWidth interface.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVSessionSetPlaybackPosition001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVSessionSetPlaybackPositionSuccess();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionSetPlaybackPosition001 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number   SUB_AVSession_SetPlaybackPosition_002
     * @tc.name     testAVSessionSetPlaybackPosition002
     * @tc.desc     testing OH_ArkUI_CustomSpanMetrics_SetWidth interface.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVSessionSetPlaybackPosition002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVSessionSetPlaybackPositionInvalidParam();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionSetPlaybackPosition001 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number   SUB_AVSession_SetFavorite_001
     * @tc.name     testAVSessionSetFavorite001
     * @tc.desc     testing OH_ArkUI_CustomSpanMetrics_SetWidth interface.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVSessionSetFavorite001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVSessionSetFavoriteSuccess();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionSetFavorite001 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number   SUB_AVSession_SetFavorite_002
     * @tc.name     testAVSessionSetFavorite002
     * @tc.desc     testing OH_ArkUI_CustomSpanMetrics_SetWidth interface.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVSessionSetFavorite002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVSessionSetFavoriteInvalidParam();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionSetFavorite002 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number   SUB_AVSession_SetLoopMode_001
     * @tc.name     testAVSessionSetLoopMode001
     * @tc.desc     testing OH_ArkUI_CustomSpanMetrics_SetWidth interface.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVSessionSetLoopMode001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVSessionSetLoopModeSuccess();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionSetLoopMode001 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number   SUB_AVSession_SetLoopMode_002
     * @tc.name     testAVSessionSetLoopMode002
     * @tc.desc     testing OH_ArkUI_CustomSpanMetrics_SetWidth interface.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVSessionSetLoopMode002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVSessionSetLoopModeInvalidParam();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionSetLoopMode002 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number   SUB_AVSession_RegisterCommandCallback_001
     * @tc.name     testAVSessionRegisterCommandCallback001
     * @tc.desc     testing OH_ArkUI_CustomSpanMetrics_SetWidth interface.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVSessionRegisterCommandCallback001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVSessionRegisterCommandCallbackSuccess();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionRegisterCommandCallback001 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number   SUB_AVSession_RegisterCommandCallback_002
     * @tc.name     testAVSessionRegisterCommandCallback002
     * @tc.desc     testing OH_ArkUI_CustomSpanMetrics_SetWidth interface.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVSessionRegisterCommandCallback002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVSessionRegisterCommandCallbackInvalidParam();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionRegisterCommandCallback002 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number   SUB_AVSession_RegisterCommandCallback_003
     * @tc.name     testAVSessionRegisterCommandCallback003
     * @tc.desc     testing OH_ArkUI_CustomSpanMetrics_SetWidth interface.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVSessionRegisterCommandCallback003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVSessionRegisterCommandCallbackCommandInvalid();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionRegisterCommandCallback003 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number   SUB_AVSession_UnregisterCommandCallback_001
     * @tc.name     testAVSessionUnregisterCommandCallback001
     * @tc.desc     testing OH_ArkUI_CustomSpanMetrics_SetWidth interface.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVSessionUnregisterCommandCallback001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVSessionUnregisterCommandCallbackSuccess();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionUnregisterCommandCallback001 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number   SUB_AVSession_UnregisterCommandCallback_002
     * @tc.name     testAVSessionUnregisterCommandCallback002
     * @tc.desc     testing OH_ArkUI_CustomSpanMetrics_SetWidth interface.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVSessionUnregisterCommandCallback002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVSessionUnregisterCommandCallbackInvalidParam();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionUnregisterCommandCallback002 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number   SUB_AVSession_UnregisterCommandCallback_003
     * @tc.name     testAVSessionUnregisterCommandCallback003
     * @tc.desc     testing OH_ArkUI_CustomSpanMetrics_SetWidth interface.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVSessionUnregisterCommandCallback003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVSessionUnregisterCommandCallbackCommandInvalid();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionUnregisterCommandCallback003 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });
  })
}