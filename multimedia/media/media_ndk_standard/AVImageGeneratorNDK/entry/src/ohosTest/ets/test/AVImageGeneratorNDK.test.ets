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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
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
     * @tc.number     : SUB_MULTIMEIDA_AVIMAGEGENERATOR_OHAVIMAGEGENERATORCREATE_0100
     * @tc.name       : testOhAvImageGeneratorCreate001
     * @tc.desc       : A pointer to the OH_AVImageGenerator object that is used to create and return the object.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOhAvImageGeneratorCreate001', 0, (done: Function) => {
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
     * @tc.number     : SUB_MULTIMEIDA_AVIMAGEGENERATOR_OHAVIMAGEGENERATORSETFDSOURCE_0100
     * @tc.name       : OhAvImageGeneratorSetFdSource001
     * @tc.desc       : Set fd soucre.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOhAvImageGeneratorSetFdSource001', 0, async (done: Function) => {
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
     * @tc.number     : SUB_MULTIMEIDA_AVIMAGEGENERATOR_OHAVIMAGEGENERATORSETFDSOURCETWO_0200
     * @tc.name       : testOhAVImageGeneratorSetFdPathSourceTwo0200
     * @tc.desc       : Set invalid fd soucre.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOhAVImageGeneratorSetFdPathSourceTwo0200', 0, (done: Function) => {
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
     * @tc.number     : SUB_MULTIMEIDA_AVIMAGEGENERATOR_OHAVIMAGEGENERATORFETCHFRAMEBYTIME_0100
     * @tc.name       : testOhAvImageGeneratorFetchFrameByTime001
     * @tc.desc       : Set the right timeUs and options is AV_IMAGE_QUERY_PREVIOUS_SYNC.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOhAvImageGeneratorFetchFrameByTime001', 0, async (done: Function) => {
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
     * @tc.number     : SUB_MULTIMEIDA_AVIMAGEGENERATOR_OHAVIMAGEGENERATORFETCHFRAMEBYTIME_0200
     * @tc.name       : testOhAvImageGeneratorFetchFrameByTime002
     * @tc.desc       : Set the right timeUs and options is AV_IMAGE_QUERY_CLOSEST_SYNC.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOhAvImageGeneratorFetchFrameByTime002', 0, async (done: Function) => {
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
     * @tc.number     : SUB_MULTIMEIDA_AVIMAGEGENERATOR_OHAVIMAGEGENERATORFETCHFRAMEBYTIME_0300
     * @tc.name       : testOhAvImageGeneratorFetchFrameByTime003
     * @tc.desc       : Set the right timeUs and options is AV_IMAGE_QUERY_CLOSEST.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOhAvImageGeneratorFetchFrameByTime003', 0, async (done: Function) => {
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
     * @tc.number     : SUB_MULTIMEIDA_AVIMAGEGENERATOR_OHAVIMAGEGENERATORFETCHFRAMEBYTIME_0400
     * @tc.name       : testOhAvImageGeneratorFetchFrameByTime004
     * @tc.desc       : Set the invalid timeUs and invalid options.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOhAvImageGeneratorFetchFrameByTime004', 0, async (done: Function) => {
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
     * @tc.number     : SUB_MULTIMEIDA_AVIMAGEGENERATOR_OHAVIMAGEGENERATORFETCHFRAMEBYTIME_0500
     * @tc.name       : testOhAvImageGeneratorFetchFrameByTime005
     * @tc.desc       : Set the right timeUs and invalid options.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOhAvImageGeneratorFetchFrameByTime005', 0, async (done: Function) => {
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
     * @tc.number     : SUB_MULTIMEIDA_AVIMAGEGENERATOR_OHAVIMAGEGENERATORFETCHFRAMEBYTIME_0600
     * @tc.name       : testOhAvImageGeneratorFetchFrameByTime006
     * @tc.desc       : Set the invalid timeUs and right options.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOhAvImageGeneratorFetchFrameByTime006', 0, async (done: Function) => {
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
     * @tc.number     : SUB_MULTIMEIDA_AVIMAGEGENERATOR_OHAVIMAGEGENERATORFETCHFRAMEBYTIME_0700
     * @tc.name       : testOhAvImageGeneratorFetchFrameByTime007
     * @tc.desc       : Set the right timeUs and options is AV_IMAGE_QUERY_NEXT_SYNC.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOhAvImageGeneratorFetchFrameByTime007', 0, async (done: Function) => {
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
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_OHAVIMAGEGENERATORRELEASE_0100
     * @tc.name       : testOhAvImageGeneratorRelease001
     * @tc.desc       : Set an unreleased pointer.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOhAvImageGeneratorRelease001', 0, (done: Function) => {
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
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_OHAVIMAGEGENERATORRELEASETWO_0200
     * @tc.name       : testOhAvImageGeneratorRelease002
     * @tc.desc       : Set the pointer which is nullptr.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOhAvImageGeneratorRelease002', 0, (done: Function) => {
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
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_OHAVIMAGEGENERATORRELEASE_0300
     * @tc.name       : testOhAvImageGeneratorRelease003
     * @tc.desc       : Repeat the release of the pointer.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOhAvImageGeneratorRelease003', 0, (done: Function) => {
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