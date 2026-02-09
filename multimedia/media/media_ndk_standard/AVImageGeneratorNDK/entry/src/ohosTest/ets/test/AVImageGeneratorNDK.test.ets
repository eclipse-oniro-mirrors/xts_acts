/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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
import { BusinessError } from '@ohos.base';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry'
import avimagegenerator from 'libavimagegeneratorndk.so'
import common from '@ohos.app.ability.common';
import hilog from '@ohos.hilog';
import fs from '@ohos.file.fs'
import media from '@ohos.multimedia.media';
import Utils from './Utils';

const sleep5000: number = 5000;

const AV_ERR_OK = 0 //操作成功;

export default function OhAvImageGeneratorNDKTest() {

  describe('OhavimagegeneratorNDKTest', () => {
    let filesDir: string | undefined;
    let testContext: common.UIAbilityContext;

    beforeAll(async () => {
      console.info('beforeAll case');
      testContext = AppStorage.get<common.UIAbilityContext>('testContext') as common.UIAbilityContext;
      filesDir = AppStorage.get('pathDir');
      await Utils.sleep(sleep5000);
    });
    beforeEach(async () => {
      console.info('beforeEach case');
    });
    afterEach(() => {
      console.info('afterEach case');
    });
    afterAll(() => {
      console.info('afterAll case ');
    });

    interface AVFileDescriptor {
      fd: number;
    }

    const getfile = (fileName: string): AVFileDescriptor => {
      const filePath = filesDir + '/' + fileName;
      let file = fs.openSync(filePath);
      return {fd: file.fd};
    }

    const closefile = (fd: number): void => {
      if (fd > 0) {
        try {
          fs.closeSync(fd);
        } catch (err) {
          console.error(`Failed to close fd ${fd}:`, err);
        }
      }
    }

    /**
     * @tc.name   testOhAvImageGeneratorCreate001
     * @tc.number SUB_MULTIMEIDA_AVIMAGEGENERATOR_OHAVIMAGEGENERATORCREATE_0100
     * @tc.desc   A pointer to the OH_AVImageGenerator object that is used to create and return the object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvImageGeneratorCreate001', Level.LEVEL0,(done: Function) => {
      console.info(`testOhAvImageGeneratorCreate001 test start `);
      try {
        let result: number = avimagegenerator.OhAvImageGeneratorCreate();
        expect(result).assertEqual(AV_ERR_OK);
        hilog.info(0x0000, 'testTag', '%{public}s', `testOhAvImageGeneratorCreate001:${result}`);
      } catch (error) {
        hilog.info(0x0000, 'testTag', '%{public}s', `testOhAvImageGeneratorCreate001:${error}`);
        expect().assertFail();
      }
      console.info(`testOhAvImageGeneratorCreate001 test end `);
      done();
    });

    /**
     * @tc.name   testOhAvImageGeneratorSetFdSource001
     * @tc.number SUB_MULTIMEIDA_AVIMAGEGENERATOR_OHAVIMAGEGENERATORSETFDSOURCE_0100
     * @tc.desc   Set fd soucre.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvImageGeneratorSetFdSource001', Level.LEVEL0,async (done: Function) => {
      console.info(`testOhAvImageGeneratorSetFdSource001 test start `);
      let fileDescribe: number = -1;
      try {
        let avFileDescriptor: media.AVFileDescriptor = getfile("H264_AAC.mp4");
        fileDescribe = avFileDescriptor.fd;
        let result: number = await avimagegenerator.OhAvImageGeneratorSetFdSource(fileDescribe);
        expect(result).assertEqual(AV_ERR_OK);
      } catch (error) {
        hilog.info(0x0000, 'testTag', '%{public}s', `testOhAvImageGeneratorSetFdSource001:${error}`);
        expect().assertFail();
      }
      console.info(`testOhAvImageGeneratorSetFdSource001 test end `);
      closefile(fileDescribe);
      done();
    });

    /**
     * @tc.name   testOhAVImageGeneratorSetFdPathSourceTwo0200
     * @tc.number SUB_MULTIMEIDA_AVIMAGEGENERATOR_OHAVIMAGEGENERATORSETFDSOURCETWO_0200
     * @tc.desc   Set invalid fd soucre.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAVImageGeneratorSetFdPathSourceTwo0200', Level.LEVEL0,(done: Function) => {
      console.info(`testOhAVImageGeneratorSetFdPathSourceTwo0200 test start `);
      try {
        let result: number = avimagegenerator.OhAVImageGeneratorSetFdPathSourceTwo();
        expect(result).not().assertEqual(AV_ERR_OK);
      } catch (error) {
        hilog.info(0x0000, 'testTag', '%{public}s', `testOhAVImageGeneratorSetFdPathSourceTwo0200:${error}`);
        expect().assertFail();
      }
      console.info(`testOhAVImageGeneratorSetFdPathSourceTwo0200 test end `);
      done();
    });

    /**
     * @tc.name   testOhAvImageGeneratorFetchFrameByTime001
     * @tc.number SUB_MULTIMEIDA_AVIMAGEGENERATOR_OHAVIMAGEGENERATORFETCHFRAMEBYTIME_0100
     * @tc.desc   Set the right timeUs and options is AV_IMAGE_QUERY_PREVIOUS_SYNC.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvImageGeneratorFetchFrameByTime001', Level.LEVEL0,async (done: Function) => {
      console.info(`testOhAvImageGeneratorFetchFrameByTime001 test start `);
      let fileDescribe: number = -1;
      try {
        let avFileDescriptor: media.AVFileDescriptor = getfile("H264_AAC.mp4");
        fileDescribe = avFileDescriptor.fd;
        const timeUs: number = 100;
        const options: number = 1;
        console.info(`testOhAvImageGeneratorFetchFrameByTime001 input timeUs: ${timeUs}, options: ${options}`);
        let result: number = await avimagegenerator.OhAvImageGeneratorFetchFrameByTime(fileDescribe, timeUs, options);
        expect(result).assertEqual(AV_ERR_OK);
        hilog.info(0x0000, 'testTag', '%{public}s', `testOhAvImageGeneratorFetchFrameByTime001:${result}`);
      } catch (error) {
        hilog.info(0x0000, 'testTag', '%{public}s', `testOhAvImageGeneratorFetchFrameByTime001:${error}`);
        expect().assertFail();
      }
      console.info(`testOhAvImageGeneratorFetchFrameByTime001 test end `);
      closefile(fileDescribe);
      done();
    });

    /**
     * @tc.name   testOhAvImageGeneratorFetchFrameByTime002
     * @tc.number SUB_MULTIMEIDA_AVIMAGEGENERATOR_OHAVIMAGEGENERATORFETCHFRAMEBYTIME_0200
     * @tc.desc   Set the right timeUs and options is AV_IMAGE_QUERY_CLOSEST_SYNC.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvImageGeneratorFetchFrameByTime002', Level.LEVEL0,async (done: Function) => {
      console.info(`testOhAvImageGeneratorFetchFrameByTime002 test start `);
      let fileDescribe: number = -1;
      try {
        let avFileDescriptor: media.AVFileDescriptor = getfile("H264_AAC.mp4");
        fileDescribe = avFileDescriptor.fd;
        const timeUs: number = 100;
        const options: number = 2;
        console.info(`testOhAvImageGeneratorFetchFrameByTime002 input timeUs: ${timeUs}, options: ${options}`);
        let result: number = await avimagegenerator.OhAvImageGeneratorFetchFrameByTime(fileDescribe, timeUs, options);
        expect(result).assertEqual(AV_ERR_OK);
        hilog.info(0x0000, 'testTag', '%{public}s', `testOhAvImageGeneratorFetchFrameByTime002:${result}`);
      } catch (error) {
        hilog.info(0x0000, 'testTag', '%{public}s', `testOhAvImageGeneratorFetchFrameByTime002:${error}`);
        expect().assertFail();
      }
      console.info(`testOhAvImageGeneratorFetchFrameByTime002 test end `);
      closefile(fileDescribe);
      done();
    });

    /**
     * @tc.name   testOhAvImageGeneratorFetchFrameByTime003
     * @tc.number SUB_MULTIMEIDA_AVIMAGEGENERATOR_OHAVIMAGEGENERATORFETCHFRAMEBYTIME_0300
     * @tc.desc   Set the right timeUs and options is AV_IMAGE_QUERY_CLOSEST.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvImageGeneratorFetchFrameByTime003', Level.LEVEL0,async (done: Function) => {
      console.info(`testOhAvImageGeneratorFetchFrameByTime003 test start `);
      let fileDescribe: number = -1;
      try {
        let avFileDescriptor: media.AVFileDescriptor = getfile("H264_AAC.mp4");
        fileDescribe = avFileDescriptor.fd;
        const timeUs: number = 100;
        const options: number = 3;
        console.info(`testOhAvImageGeneratorFetchFrameByTime003 input timeUs: ${timeUs}, options: ${options}`);
        let result: number = await avimagegenerator.OhAvImageGeneratorFetchFrameByTime(fileDescribe, timeUs, options);
        expect(result).assertEqual(AV_ERR_OK);
        hilog.info(0x0000, 'testTag', '%{public}s', `testOhAvImageGeneratorFetchFrameByTime003:${result}`);
      } catch (error) {
        hilog.info(0x0000, 'testTag', '%{public}s', `testOhAvImageGeneratorFetchFrameByTime003:${error}`);
        expect().assertFail();
      }
      console.info(`testOhAvImageGeneratorFetchFrameByTime003 test end `);
      closefile(fileDescribe);
      done();
    });

    /**
     * @tc.name   testOhAvImageGeneratorFetchFrameByTime004
     * @tc.number SUB_MULTIMEIDA_AVIMAGEGENERATOR_OHAVIMAGEGENERATORFETCHFRAMEBYTIME_0400
     * @tc.desc   Set the invalid timeUs and invalid options.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvImageGeneratorFetchFrameByTime004', Level.LEVEL0,async (done: Function) => {
      console.info(`testOhAvImageGeneratorFetchFrameByTime004 test start `);
      let fileDescribe: number = -1;
      try {
        let avFileDescriptor: media.AVFileDescriptor = getfile("H264_AAC.mp4");
        fileDescribe = avFileDescriptor.fd;
        const timeUs: number = -1;
        const options: number = 99;
        console.info(`testOhAvImageGeneratorFetchFrameByTime004 input timeUs: ${timeUs}, options: ${options}`);
        let result: number = await avimagegenerator.OhAvImageGeneratorFetchFrameByTime(fileDescribe, timeUs, options);
        expect(result).not().assertEqual(AV_ERR_OK);
        hilog.info(0x0000, 'testTag', '%{public}s', `testOhAvImageGeneratorFetchFrameByTime004:${result}`);
      } catch (error) {
        hilog.info(0x0000, 'testTag', '%{public}s', `testOhAvImageGeneratorFetchFrameByTime004:${error}`);
        expect().assertFail();
      }
      console.info(`testOhAvImageGeneratorFetchFrameByTime004 test end `);
      closefile(fileDescribe);
      done();
    });

    /**
     * @tc.name   testOhAvImageGeneratorFetchFrameByTime005
     * @tc.number SUB_MULTIMEIDA_AVIMAGEGENERATOR_OHAVIMAGEGENERATORFETCHFRAMEBYTIME_0500
     * @tc.desc   Set the right timeUs and invalid options.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvImageGeneratorFetchFrameByTime005', Level.LEVEL0,async (done: Function) => {
      console.info(`testOhAvImageGeneratorFetchFrameByTime005 test start `);
      let fileDescribe: number = -1;
      try {
        let avFileDescriptor: media.AVFileDescriptor = getfile("H264_AAC.mp4");
        fileDescribe = avFileDescriptor.fd;
        const timeUs: number = 150;
        const options: number = 99;
        console.info(`testOhAvImageGeneratorFetchFrameByTime005 input timeUs: ${timeUs}, options: ${options}`);
        let result: number = await avimagegenerator.OhAvImageGeneratorFetchFrameByTime(fileDescribe, timeUs, options);
        expect(result).not().assertEqual(AV_ERR_OK);
        hilog.info(0x0000, 'testTag', '%{public}s', `testOhAvImageGeneratorFetchFrameByTime005:${result}`);
      } catch (error) {
        hilog.info(0x0000, 'testTag', '%{public}s', `testOhAvImageGeneratorFetchFrameByTime005:${error}`);
        expect().assertFail();
      }
      console.info(`testOhAvImageGeneratorFetchFrameByTime005 test end `);
      closefile(fileDescribe);
      done();
    });

    /**
     * @tc.name   testOhAvImageGeneratorFetchFrameByTime006
     * @tc.number SUB_MULTIMEIDA_AVIMAGEGENERATOR_OHAVIMAGEGENERATORFETCHFRAMEBYTIME_0600
     * @tc.desc   Set the invalid timeUs and right options.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvImageGeneratorFetchFrameByTime006', Level.LEVEL0,async (done: Function) => {
      console.info(`testOhAvImageGeneratorFetchFrameByTime006 test start `);
      let fileDescribe: number = -1;
      try {
        let avFileDescriptor: media.AVFileDescriptor = getfile("H264_AAC.mp4");
        fileDescribe = avFileDescriptor.fd;
        const timeUs: number = -1;
        const options: number = 2;
        console.info(`testOhAvImageGeneratorFetchFrameByTime006 input timeUs: ${timeUs}, options: ${options}`);
        let result: number = await avimagegenerator.OhAvImageGeneratorFetchFrameByTime(fileDescribe, timeUs, options);
        expect(result).assertEqual(AV_ERR_OK);
        hilog.info(0x0000, 'testTag', '%{public}s', `testOhAvImageGeneratorFetchFrameByTime006:${result}`);
      } catch (error) {
        hilog.info(0x0000, 'testTag', '%{public}s', `testOhAvImageGeneratorFetchFrameByTime006:${error}`);
        expect().assertFail();
      }
      console.info(`testOhAvImageGeneratorFetchFrameByTime006 test end `);
      closefile(fileDescribe);
      done();
    });

    /**
     * @tc.name   testOhAvImageGeneratorFetchFrameByTime007
     * @tc.number SUB_MULTIMEIDA_AVIMAGEGENERATOR_OHAVIMAGEGENERATORFETCHFRAMEBYTIME_0700
     * @tc.desc   Set the right timeUs and options is AV_IMAGE_QUERY_NEXT_SYNC.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvImageGeneratorFetchFrameByTime007', Level.LEVEL0,async (done: Function) => {
      console.info(`testOhAvImageGeneratorFetchFrameByTime007 test start `);
      let fileDescribe: number = -1;
      try {
        let avFileDescriptor: media.AVFileDescriptor = getfile("H264_AAC.mp4");
        fileDescribe = avFileDescriptor.fd;
        const timeUs: number = 100;
        const options: number = 0;
        console.info(`testOhAvImageGeneratorFetchFrameByTime007 input timeUs: ${timeUs}, options: ${options}`);
        let result: number = await avimagegenerator.OhAvImageGeneratorFetchFrameByTime(fileDescribe, timeUs, options);
        expect(result).assertEqual(AV_ERR_OK);
        hilog.info(0x0000, 'testTag', '%{public}s', `testOhAvImageGeneratorFetchFrameByTime007:${result}`);
      } catch (error) {
        hilog.info(0x0000, 'testTag', '%{public}s', `testOhAvImageGeneratorFetchFrameByTime007:${error}`);
        expect().assertFail();
      }
      console.info(`testOhAvImageGeneratorFetchFrameByTime007 test end `);
      closefile(fileDescribe);
      done();
    });

    /**
     * @tc.name   testOhAvImageGeneratorRelease001
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_OHAVIMAGEGENERATORRELEASE_0100
     * @tc.desc   Set an unreleased pointer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvImageGeneratorRelease001', Level.LEVEL0,(done: Function) => {
      console.info(`testOhAvImageGeneratorRelease001 test start`);
      try {
        let result: number = avimagegenerator.OhAvImageGeneratorRelease();
        expect(result).assertEqual(AV_ERR_OK);
        hilog.info(0x0000, 'testTag', '%{public}s', `testOhAvImageGeneratorRelease001:${result}`);
      } catch (error){
        hilog.info(0x0000, 'testTag', '%{public}s', `testOhAvImageGeneratorRelease001:${error}`);
        expect().assertFail();
      }
      console.info(`testOhAvImageGeneratorRelease001 test end`);
      done();
    });

    /**
     * @tc.name   testOhAvImageGeneratorRelease002
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_OHAVIMAGEGENERATORRELEASETWO_0200
     * @tc.desc   Set the pointer which is nullptr.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvImageGeneratorRelease002', Level.LEVEL0,(done: Function) => {
      console.info(`testOhAvImageGeneratorRelease002 test start`);
      try {
        let result: number = avimagegenerator.OhAvImageGeneratorReleaseTwo();
        expect(result).not().assertEqual(AV_ERR_OK);
        hilog.info(0x0000, 'testTag', '%{public}s', `testOhAvImageGeneratorRelease002:${result}`);
      } catch (error){
        hilog.info(0x0000, 'testTag', '%{public}s', `testOhAvImageGeneratorRelease002:${error}`);
        expect().assertFail();
      }
      console.info(`testOhAvImageGeneratorRelease002 test end`);
      done();
    });

    /**
     * @tc.name   testOhAvImageGeneratorRelease003
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_OHAVIMAGEGENERATORRELEASE_0300
     * @tc.desc   Repeat the release of the pointer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvImageGeneratorRelease003', Level.LEVEL0,(done: Function) => {
      console.info(`testOhAvImageGeneratorRelease003 test start`);
      try {
        let result: number = avimagegenerator.OhAvImageGeneratorRelease();
        result = avimagegenerator.OhAvImageGeneratorRelease();
        expect(result).assertEqual(AV_ERR_OK);
        hilog.info(0x0000, 'testTag', '%{public}s', `testOhAvImageGeneratorRelease003:${result}`);
      } catch (error){
        hilog.info(0x0000, 'testTag', '%{public}s', `testOhAvImageGeneratorRelease003:${error}`);
        expect().assertFail();
      }
      console.info(`testOhAvImageGeneratorRelease003 test end`);
      done();
    });

  });
}