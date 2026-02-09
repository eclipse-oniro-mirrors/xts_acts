/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level } from "@ohos/hypium";
import { media } from "@kit.MediaKit";
import { url } from "@kit.ArkTS";
import { sleep } from "../common";

const TAG ='MediaXts.SetUrISource';
async function testSetUrlSource(testName: string,callback:(avMetadataExtractor: media.AVMetadataExtractor)=>void,){
  let avMetadataExtractor: media.AVMetadataExtractor = await media.createAVMetadataExtractor();
  console.info(TAG,testName,'createImageSource',avMetadataExtractor);
  callback(avMetadataExtractor)
  await avMetadataExtractor.release();
  expect().assertFail();
}
export default function SetUrISourceTest() {
  describe('SetUrISourceTest', () => {
    beforeAll(async () => {
      console.info(TAG, 'beforeAll case.');
      AppStorage.setOrCreate('testString', 'abc');
      AppStorage.setOrCreate('testArray', [-1, 0, 1]);

    });
    beforeEach(() => {
      console.info(TAG, 'beforeEach case.');
    });
    afterEach(() => {
      console.info(TAG, 'afterEach case.');
    });
    afterAll(async () => {
      AppStorage.delete('testString');
      AppStorage.delete('testArray');
      console.info(TAG, 'afterAll case.');
      await sleep(2000);
    });

    /**
     * @tc.number    MUTI_MEDIA_AVMETADATA_EXTRACTOR_SETURI_SOURCE_001
     * @tc.name      MUTI_MEDIA_AVMETADATA_EXTRACTOR_SETURI_SOURCE_001
     * @tc.desc      Testing SetUrISource
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it ('MUTI_MEDIA_AVMETADATA_EXTRACTOR_SETURI_SOURCE_001',Level.LEVEL0,async (done : Function)=>{
      const testName = 'MUTI_MEDIA_AVMETADATA_EXTRACTOR_SETURI_SOURCE_001';
      try {
        testSetUrlSource(testName, async (AVMetadataExtractor) => {
          AVMetadataExtractor.setUrlSource('', { "User-Agent": "User-Agent-Value" });
          console.info(TAG, testName, 'succeed');
          await AVMetadataExtractor.release()
          done();
      })
        done();
      }catch (error){
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    MUTI_MEDIA_AVMETADATA_EXTRACTOR_SETURI_SOURCE_002
     * @tc.name      MUTI_MEDIA_AVMETADATA_EXTRACTOR_SETURI_SOURCE_002
     * @tc.desc      Testing SetUrISource
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it ('MUTI_MEDIA_AVMETADATA_EXTRACTOR_SETURI_SOURCE_002',Level.LEVEL0,async (done : Function)=>{
      const testName = 'MUTI_MEDIA_AVMETADATA_EXTRACTOR_SETURI_SOURCE_002';
      try {
        testSetUrlSource(testName, async (AVMetadataExtractor) => {
          AVMetadataExtractor.setUrlSource(null, { "User-Agent": "User-Agent-Value" });
          console.info(TAG, testName, 'succeed');
          await AVMetadataExtractor.release()
          done();
        })
        done();
      }catch (error){
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    MUTI_MEDIA_AVMETADATA_EXTRACTOR_SETURI_SOURCE_003
     * @tc.name      MUTI_MEDIA_AVMETADATA_EXTRACTOR_SETURI_SOURCE_003
     * @tc.desc      Testing SetUrISource
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it ('MUTI_MEDIA_AVMETADATA_EXTRACTOR_SETURI_SOURCE_003',Level.LEVEL0,async (done : Function)=>{
      const testName = 'MUTI_MEDIA_AVMETADATA_EXTRACTOR_SETURI_SOURCE_003';
      try {
        testSetUrlSource(testName, async (AVMetadataExtractor) => {
          AVMetadataExtractor.setUrlSource(undefined, { "User-Agent": "User-Agent-Value" });
          console.info(TAG, testName, 'succeed');
          await AVMetadataExtractor.release()
          done();
        })
        done();
      }catch (error){
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    MUTI_MEDIA_AVMETADATA_EXTRACTOR_SETURI_SOURCE_004
     * @tc.name      MUTI_MEDIA_AVMETADATA_EXTRACTOR_SETURI_SOURCE_004
     * @tc.desc      Testing SetUrISource
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it ('MUTI_MEDIA_AVMETADATA_EXTRACTOR_SETURI_SOURCE_004',Level.LEVEL0,async (done : Function)=>{
      const testName = 'MUTI_MEDIA_AVMETADATA_EXTRACTOR_SETURI_SOURCE_004';
      try {
        testSetUrlSource(testName, async (AVMetadataExtractor) => {
          AVMetadataExtractor.setUrlSource('https://hwposter-inland.hwcloudtest.cn/rem/ruanjie/h264_480x270_0.2m_30fp_cenc/dash.mpd', { });
          console.info(TAG, testName, 'succeed');
          await AVMetadataExtractor.release()
          done();
        })
        done();
      }catch (error){
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    MUTI_MEDIA_AVMETADATA_EXTRACTOR_SETURI_SOURCE_005
     * @tc.name      MUTI_MEDIA_AVMETADATA_EXTRACTOR_SETURI_SOURCE_005
     * @tc.desc      Testing SetUrISource
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it ('MUTI_MEDIA_AVMETADATA_EXTRACTOR_SETURI_SOURCE_005',Level.LEVEL0,async (done : Function)=>{
      const testName = 'MUTI_MEDIA_AVMETADATA_EXTRACTOR_SETURI_SOURCE_005';
      try {
        testSetUrlSource(testName, async (AVMetadataExtractor) => {
          AVMetadataExtractor.setUrlSource('https://hwposter-inland.hwcloudtest.cn/rem/ruanjie/h264_480x270_0.2m_30fp_cenc/dash.mpd', null);
          console.info(TAG, testName, 'succeed');
          await AVMetadataExtractor.release()
          done();
        })
        done();
      }catch (error){
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    MUTI_MEDIA_AVMETADATA_EXTRACTOR_SETURI_SOURCE_006
     * @tc.name      MUTI_MEDIA_AVMETADATA_EXTRACTOR_SETURI_SOURCE_006
     * @tc.desc      Testing SetUrISource
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it ('MUTI_MEDIA_AVMETADATA_EXTRACTOR_SETURI_SOURCE_006',Level.LEVEL0,async (done : Function)=>{
      const testName = 'MUTI_MEDIA_AVMETADATA_EXTRACTOR_SETURI_SOURCE_006';
      try {
        testSetUrlSource(testName, async (AVMetadataExtractor) => {
          AVMetadataExtractor.setUrlSource('https://hwposter-inland.hwcloudtest.cn/rem/ruanjie/h264_480x270_0.2m_30fp_cenc/dash.mpd', undefined);
          console.info(TAG, testName, 'succeed');
          await AVMetadataExtractor.release()
          done();
        })
        done();
      }catch (error){
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    MUTI_MEDIA_AVMETADATA_EXTRACTOR_SETURI_SOURCE_007
     * @tc.name      MUTI_MEDIA_AVMETADATA_EXTRACTOR_SETURI_SOURCE_007
     * @tc.desc      Testing SetUrISource
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it ('MUTI_MEDIA_AVMETADATA_EXTRACTOR_SETURI_SOURCE_007',Level.LEVEL0,async (done : Function)=>{
      const testName = 'MUTI_MEDIA_AVMETADATA_EXTRACTOR_SETURI_SOURCE_007';
      try {
        testSetUrlSource(testName, async (AVMetadataExtractor) => {
          AVMetadataExtractor.setUrlSource('https://hwposter-inland.hwcloudtest.cn/rem/ruanjie/h264_480x270_0.2m_30fp_cenc/dash.mpd', {"User-Agent": "User-Agent-Value"});
          console.info(TAG, testName, 'succeed');
          await AVMetadataExtractor.release()
          done();
        })
        done();
      }catch (error){
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect().assertFail();
        done();
      }
    })
  })
}