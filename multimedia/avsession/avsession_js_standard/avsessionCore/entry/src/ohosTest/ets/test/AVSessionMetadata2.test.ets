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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import avSession from '@ohos.multimedia.avsession';
import featureAbility from '@ohos.ability.featureAbility';
import image from '@ohos.multimedia.image';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';


let sleep = (ms: number): Promise<string> => {
  return new Promise((resolve) => {
    setTimeout(() => {
      resolve('');
    }, ms)
  })
}

interface Size_Pixel {
  height: number,
  width: number
}

interface Opts {
  editable: boolean,
  pixelFormat: number,
  size: Size_Pixel,
  AlphaType: number
};

let context: common.UIAbilityContext;

let metadata0: avSession.AVMetadata = {
  assetId : '9526',
  title: "lose yourself",
  artist: "Eminem",
  author: "ST",
  avQueueName: "session queuename",
  avQueueId: "session queueid",
  avQueueImage: "session queueimage",
  album: "Slim shady",
  writer: "ST",
  composer: "ST",
  duration: 2222,
  mediaImage: "https://www.example.com/example.jpg",
  publishDate: new Date(1994,1,1,1),
  subtitle: "8 Mile",
  description: "Rap",
  lyric: "lrc格式歌词内容",
  singleLyricText: "单条歌词内容",
  previousAssetId: "121277",
  nextAssetId: "121279",
  filter: 2,
  drmSchemes: ['123123','456456'],
  skipIntervals: 10,
  displayTags: 1,
  rewindSkipIntervals: 10,
  fastForwardSkipIntervals: 10
};

let playbackState0: avSession.AVPlaybackState = {
  state:avSession.PlaybackState.PLAYBACK_STATE_PLAY,
  speed: 1.0,
  position: {elapsedTime:10, updateTime:(new Date()).getTime()},
  bufferedTime: 1000,
  loopMode: avSession.LoopMode.LOOP_MODE_SINGLE,
  isFavorite: true,
  activeItemId: 123456,
  volume: 4,
  maxVolume: 15,
  muted: true,
  duration: 123,
  videoWidth: 30,
  videoHeight: 20,
  extras: {'EX': 'this is session ex'}
};


export default function abilityTest() {
  describe('AVSessionMetadata2', () => {
    let TAG: string = "[AVSessionMetadata2]";
    let session: avSession.AVSession | ESObject;
    let controller: avSession.AVSessionController | ESObject;
    let receivedCallback1: boolean = false;
    let receivedCallback2: boolean = false;
    let tag: string = 'MetadataXTS';
    let assetId: string = 'assetIdTest';
    let assetId2: string = '~!@#$%^&*()_+{}:">?,./123456789'+'a'.repeat(40928);
    let assetId3: string = 'a'.repeat(40960)
    let assetId4: number = 123

    let getPixelMap = async (opts: Opts) => {
      let color = new ArrayBuffer(96);
      let bufferArr = new Uint8Array(color);
      bufferArr.fill(3, 0, 95);
      return image.createPixelMap(color, opts);
    }

    beforeAll(() => {
      context = AppStorage.get<common.UIAbilityContext>('testContext') as common.UIAbilityContext;
      console.info(`${TAG}: beforeAll in`);
    })

    beforeEach(async () => {
      console.info(`${TAG}: beforeEach in`);
      console.info(`${TAG}: createAVSession begin`);
      await avSession.createAVSession(context, tag, 'voice_call').then((data) => {
        session = data;
        session.sessionType = 'voice_call';
        console.info(`${TAG}: avSession create success`);
      }).catch((err: BusinessError) => {
        console.info(`${TAG}: Session create error: code: ${err.code}, message: ${err.message}`);
      });
      await session.activate().then(() => {
        console.info(`${TAG}: Session activate`);
      }).catch((err: BusinessError) => {
        console.info(`${TAG}: Session activate error: code: ${err.code}, message: ${err.message}`);
      });
      try {
        controller = await session.getController();
      } catch (err) {
        console.info(`${TAG}: getController error: code: ${err.code}, message: ${err.message}`);
      }
      await sleep(800);
      console.info(`${TAG}: beforeEach out`);
    })

    afterEach(async () => {
      console.info(`${TAG}: afterEach in`);
      if (session != null) {
        await session.destroy().then(() => {
          console.info(`${TAG}: Session destroy success`);
        }).catch((err: BusinessError) => {
          console.info(`${TAG}: Session destroy error: code: ${err.code}, message: ${err.message}`);
        });
      } else {
        console.info(`${TAG}: Session is already destroy`);
      }
      if (controller != null) {
        await controller.destroy().then(() => {
          console.info(`${TAG}: Controller destroy success`);
        }).catch((err: BusinessError) => {
          console.info(`${TAG}: Controller destroy error: code: ${err.code}, message: ${err.message}`);
        });
      } else {
        console.info(`${TAG}: Controller is already destroy`);
      }
      console.info(`${TAG}: afterEach out`);
    })

    afterAll(() => {
      console.info(`${TAG}: afterAll in`);
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_PARAM_TRAVERSE_SETAVMETADATA_PROMISE_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_PARAM_TRAVERSE_SETAVMETADATA_PROMISE_0100
     * @tc.desc   test setAVMetadata-promise & traverse all AVMetadata combinations: case 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_PARAM_TRAVERSE_SETAVMETADATA_PROMISE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let TAG = '[SUB_MULTIMEDIA_AVSESSION_PARAM_TRAVERSE_SETAVMETADATA_PROMISE_0100]';
      let opts: Opts = {
        editable: true,
        pixelFormat: 3,
        size: {
          height: 4, width: 6
        },
        AlphaType: 3
      };
      let pixelMap = await getPixelMap(opts);
      console.info(`${TAG}TestLog: pixelMap generated successfully.`);
      let metadata1: avSession.AVMetadata = {
        assetId : '12345',
        title: "Killer Queen",
        artist: "Queen",
        author: "Queen",
        avQueueName: "avQueueName",
        avQueueId: "avQueueId",
        avQueueImage: pixelMap,
        album: "Slim shady",
        writer: "ST",
        composer: "ST",
        duration: 2222,
        mediaImage: pixelMap,
        publishDate: new Date(1994,1,1,1),
        subtitle: "subtitle",
        description: "description",
        lyric: "lrc格式歌词内容",
        singleLyricText: "单条歌词内容",
        previousAssetId: "123321",
        nextAssetId: "321123",
        filter: 0,
        drmSchemes: ['123123','456456'],
        skipIntervals: 10,
        displayTags: 1,
        rewindSkipIntervals: 10,
        fastForwardSkipIntervals: 10
      };

      await session.setAVMetadata(metadata1).then(() => {
        console.info(`${TAG}TestLog: setAVMetadata done.`);
      }).catch((err:BusinessError) => {
        console.info(`${TAG}TestLog: Business error occurred, error code: ${err.code}, message: ${err.message}`);
        expect(false).assertTrue();
      });

      await controller.getAVMetadata().then((data:avSession.AVMetadata) => {
        expect(data.assetId).assertEqual(metadata1.assetId);
        expect(data.title).assertEqual(metadata1.title);
        expect(data.artist).assertEqual(metadata1.artist);
        expect(data.author).assertEqual(metadata1.author);
        expect(data.avQueueName).assertEqual(metadata1.avQueueName);
        expect(data.avQueueId).assertEqual(metadata1.avQueueId);
        expect((data.avQueueImage as PixelMap).isEditable).assertEqual((metadata1.avQueueImage as PixelMap).isEditable);
        expect(data.album).assertEqual(metadata1.album);
        expect(data.writer).assertEqual(metadata1.writer);
        expect(data.composer).assertEqual(metadata1.composer);
        expect(data.duration).assertEqual(metadata1.duration);
        expect((data.mediaImage as PixelMap).isEditable).assertEqual((metadata1.mediaImage as PixelMap).isEditable);
        expect((data.publishDate as Date).toString()).assertEqual((metadata1.publishDate as Date).toString());
        expect(data.subtitle).assertEqual(metadata1.subtitle);
        expect(data.description).assertEqual(metadata1.description);
        expect(data.lyric).assertEqual(metadata1.lyric);
        expect(data.singleLyricText).assertEqual(metadata1.singleLyricText);
        expect(data.previousAssetId).assertEqual(metadata1.previousAssetId);
        expect(data.nextAssetId).assertEqual(metadata1.nextAssetId);
        expect(data.filter).assertEqual(metadata1.filter);
        expect(JSON.stringify(data.drmSchemes)).assertEqual(JSON.stringify(metadata1.drmSchemes));
        expect(data.skipIntervals).assertEqual(metadata1.skipIntervals);
        expect(data.displayTags).assertEqual(metadata1.displayTags);
        expect(data.rewindSkipIntervals).assertEqual(metadata1.rewindSkipIntervals);
        expect(data.fastForwardSkipIntervals).assertEqual(metadata1.fastForwardSkipIntervals);
      }).catch((err:BusinessError) => {
        console.info(`${TAG}TestLog: Business error occurred, error code: ${err.code}, message: ${err.message}`);
        expect(false).assertTrue();
      });

      if (pixelMap != undefined){
        await pixelMap.release();
      }
      await sleep(300);
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_PARAM_TRAVERSE_SETAVMETADATA_PROMISE_0200
     * @tc.number SUB_MULTIMEDIA_AVSESSION_PARAM_TRAVERSE_SETAVMETADATA_PROMISE_0200
     * @tc.desc   test setAVMetadata-promise & traverse all AVMetadata combinations: case 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_PARAM_TRAVERSE_SETAVMETADATA_PROMISE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let TAG = '[SUB_MULTIMEDIA_AVSESSION_PARAM_TRAVERSE_SETAVMETADATA_PROMISE_0200]';
      let opts: Opts = {
        editable: false,
        pixelFormat: 3,
        size: {
          height: 4, width: 6
        },
        AlphaType: 3
      };
      let pixelMap = await getPixelMap(opts);
      console.info(`${TAG}TestLog: pixelMap generated successfully.`);
      let metadata1: avSession.AVMetadata = {
        assetId : '951357',
        title: "title",
        artist: "artist",
        author: "author",
        avQueueImage: pixelMap,
        duration: 150,
        mediaImage: pixelMap,
        filter: 4,
        drmSchemes: [''],
        skipIntervals: 15,
        displayTags: 1,
        rewindSkipIntervals: 15,
        fastForwardSkipIntervals: 15
      };

      await session.setAVMetadata(metadata1).then(() => {
        console.info(`${TAG}TestLog: setAVMetadata done.`);
      }).catch((err:BusinessError) => {
        console.info(`${TAG}TestLog: Business error occurred, error code: ${err.code}, message: ${err.message}`);
        expect(false).assertTrue();
      });

      await controller.getAVMetadata().then((data:avSession.AVMetadata) => {
        expect(data.assetId).assertEqual(metadata1.assetId);
        expect(data.title).assertEqual(metadata1.title);
        expect(data.artist).assertEqual(metadata1.artist);
        expect(data.author).assertEqual(metadata1.author);
        //expect((data.avQueueImage as PixelMap).isEditable).assertEqual((metadata1.avQueueImage as PixelMap).isEditable);
        expect(data.duration).assertEqual(metadata1.duration);
        //expect((data.mediaImage as PixelMap).isEditable).assertEqual((metadata1.mediaImage as PixelMap).isEditable);
        expect(data.filter).assertEqual(metadata1.filter);
        expect(JSON.stringify(data.drmSchemes)).assertEqual(JSON.stringify(metadata1.drmSchemes));
        expect(data.skipIntervals).assertEqual(metadata1.skipIntervals);
        expect(data.displayTags).assertEqual(metadata1.displayTags);
        expect(data.rewindSkipIntervals).assertEqual(metadata1.rewindSkipIntervals);
        expect(data.fastForwardSkipIntervals).assertEqual(metadata1.fastForwardSkipIntervals);
      }).catch((err:BusinessError) => {
        console.info(`${TAG}TestLog: Business error occurred, error code: ${err.code}, message: ${err.message}`);
        expect(false).assertTrue();
      });

      await sleep(300);
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_PARAM_TRAVERSE_SETAVMETADATA_PROMISE_0300
     * @tc.number SUB_MULTIMEDIA_AVSESSION_PARAM_TRAVERSE_SETAVMETADATA_PROMISE_0300
     * @tc.desc   test setAVMetadata-promise & traverse all AVMetadata combinations: case 3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_PARAM_TRAVERSE_SETAVMETADATA_PROMISE_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let TAG = '[SUB_MULTIMEDIA_AVSESSION_PARAM_TRAVERSE_SETAVMETADATA_PROMISE_0300]';
      let metadata1: avSession.AVMetadata = {
        assetId : 'testId',
        title: "title",
        avQueueImage: "https://www.example.com/example.jpg",
        mediaImage: "https://www.example.com/example.jpg",
        filter: 8,
        drmSchemes: [],
        skipIntervals: 15,
      };

      await session.setAVMetadata(metadata1).then(() => {
        console.info(`${TAG}TestLog: setAVMetadata done.`);
      }).catch((err:BusinessError) => {
        console.info(`${TAG}TestLog: Business error occurred, error code: ${err.code}, message: ${err.message}`);
        expect(false).assertTrue();
      });

      await controller.getAVMetadata().then((data:avSession.AVMetadata) => {
        expect(data.assetId).assertEqual(metadata1.assetId);
        expect(data.title).assertEqual(metadata1.title);
        expect(data.avQueueImage).assertEqual(metadata1.avQueueImage);
        expect(data.mediaImage).assertEqual(metadata1.mediaImage);
        expect(data.filter).assertEqual(metadata1.filter);
        expect(JSON.stringify(data.drmSchemes)).assertEqual(JSON.stringify(metadata1.drmSchemes));
        expect(data.skipIntervals).assertEqual(metadata1.skipIntervals);
      }).catch((err:BusinessError) => {
        console.info(`${TAG}TestLog: Business error occurred, error code: ${err.code}, message: ${err.message}`);
        expect(false).assertTrue();
      });

      await sleep(300);
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_PARAM_TRAVERSE_SETAVMETADATA_PROMISE_0400
     * @tc.number SUB_MULTIMEDIA_AVSESSION_PARAM_TRAVERSE_SETAVMETADATA_PROMISE_0400
     * @tc.desc   test setAVMetadata-promise with invalid input param absent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_PARAM_TRAVERSE_SETAVMETADATA_PROMISE_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let TAG = '[SUB_MULTIMEDIA_AVSESSION_PARAM_TRAVERSE_SETAVMETADATA_PROMISE_0400]';
      await session.setAVMetadata().then(() => {
        console.info(`${TAG}TestLog: setAVMetadata done.`);
        expect(false).assertTrue();
      }).catch((err:BusinessError) => {
        console.info(`${TAG}TestLog: setAVMetadata error, error code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(401);
      });
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_PARAM_TRAVERSE_SETAVMETADATA_CALLBACK_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_PARAM_TRAVERSE_SETAVMETADATA_CALLBACK_0100
     * @tc.desc   test setAVMetadata-callback & traverse all AVMetadata combinations: case 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_PARAM_TRAVERSE_SETAVMETADATA_CALLBACK_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let TAG = '[SUB_MULTIMEDIA_AVSESSION_PARAM_TRAVERSE_SETAVMETADATA_CALLBACK_0100]';
      let opts: Opts = {
        editable: true,
        pixelFormat: 3,
        size: {
          height: 4, width: 6
        },
        AlphaType: 3
      };
      let pixelMap = await getPixelMap(opts);
      console.info(`${TAG}TestLog: pixelMap generated successfully.`);
      let metadata1: avSession.AVMetadata = {
        assetId : '54321',
        title: "Killer Queen",
        artist: "Queen",
        author: "Queen",
        avQueueName: "avQueueNameC",
        avQueueId: "avQueueIdC",
        avQueueImage: pixelMap,
        album: "album",
        writer: "writer",
        composer: "ST",
        duration: 2222,
        mediaImage: pixelMap,
        publishDate: new Date(1994,1,1,1),
        subtitle: "subtitle",
        description: "description",
        lyric: "lrc格式歌词内容",
        singleLyricText: "单条歌词内容",
        previousAssetId: "123321",
        nextAssetId: "321123",
        filter: 0,
        drmSchemes: ['123123','456456'],
        skipIntervals: 10,
        displayTags: 1
      };

      session.setAVMetadata(metadata1, (err:BusinessError)=>{
        if(err){
          console.info(`${TAG}TestLog: Business error occurred, error code: ${err.code}, message: ${err.message}`);
          expect(false).assertTrue();
        } else {
          console.info(`${TAG}TestLog: setAVMetadata done.`);
        }
      });
      await sleep(300);

      await controller.getAVMetadata().then((data:avSession.AVMetadata) => {
        expect(data.assetId).assertEqual(metadata1.assetId);
        expect(data.title).assertEqual(metadata1.title);
        expect(data.artist).assertEqual(metadata1.artist);
        expect(data.author).assertEqual(metadata1.author);
        expect(data.avQueueName).assertEqual(metadata1.avQueueName);
        expect(data.avQueueId).assertEqual(metadata1.avQueueId);
        expect((data.avQueueImage as PixelMap).isEditable).assertEqual((metadata1.avQueueImage as PixelMap).isEditable);
        expect(data.album).assertEqual(metadata1.album);
        expect(data.writer).assertEqual(metadata1.writer);
        expect(data.composer).assertEqual(metadata1.composer);
        expect(data.duration).assertEqual(metadata1.duration);
        expect((data.mediaImage as PixelMap).isEditable).assertEqual((metadata1.mediaImage as PixelMap).isEditable);
        expect((data.publishDate as Date).toString()).assertEqual((metadata1.publishDate as Date).toString());
        expect(data.subtitle).assertEqual(metadata1.subtitle);
        expect(data.description).assertEqual(metadata1.description);
        expect(data.lyric).assertEqual(metadata1.lyric);
        expect(data.singleLyricText).assertEqual(metadata1.singleLyricText);
        expect(data.previousAssetId).assertEqual(metadata1.previousAssetId);
        expect(data.nextAssetId).assertEqual(metadata1.nextAssetId);
        expect(data.filter).assertEqual(metadata1.filter);
        expect(JSON.stringify(data.drmSchemes)).assertEqual(JSON.stringify(metadata1.drmSchemes));
        expect(data.skipIntervals).assertEqual(metadata1.skipIntervals);
        expect(data.displayTags).assertEqual(metadata1.displayTags);
      }).catch((err:BusinessError) => {
        console.info(`${TAG}TestLog: Business error occurred, error code: ${err.code}, message: ${err.message}`);
        expect(false).assertTrue();
      });

      if (pixelMap != undefined){
        await pixelMap.release();
      }
      await sleep(300);
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_PARAM_TRAVERSE_SETAVMETADATA_CALLBACK_0200
     * @tc.number SUB_MULTIMEDIA_AVSESSION_PARAM_TRAVERSE_SETAVMETADATA_CALLBACK_0200
     * @tc.desc   test setAVMetadata-callback & traverse all AVMetadata combinations: case 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_PARAM_TRAVERSE_SETAVMETADATA_CALLBACK_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let TAG = '[SUB_MULTIMEDIA_AVSESSION_PARAM_TRAVERSE_SETAVMETADATA_CALLBACK_0200]';
      let opts: Opts = {
        editable: false,
        pixelFormat: 3,
        size: {
          height: 4, width: 6
        },
        AlphaType: 3
      };
      let pixelMap = await getPixelMap(opts);
      console.info(`${TAG}TestLog: pixelMap generated successfully.`);
      let metadata1: avSession.AVMetadata = {
        assetId : '951357',
        title: "title",
        artist: "artist",
        author: "author",
        avQueueImage: pixelMap,
        duration: 150,
        mediaImage: pixelMap,
        filter: 4,
        drmSchemes: [''],
        skipIntervals: 15,
        displayTags: 1
      };

      session.setAVMetadata(metadata1, (err:BusinessError)=>{
        if(err){
          console.info(`${TAG}TestLog: Business error occurred, error code: ${err.code}, message: ${err.message}`);
          expect(false).assertTrue();
        } else {
          console.info(`${TAG}TestLog: setAVMetadata done.`);
        }
      });
      await sleep(300);

      await controller.getAVMetadata().then((data:avSession.AVMetadata) => {
        expect(data.assetId).assertEqual(metadata1.assetId);
        expect(data.title).assertEqual(metadata1.title);
        expect(data.artist).assertEqual(metadata1.artist);
        expect(data.author).assertEqual(metadata1.author);
        //expect((data.avQueueImage as PixelMap).isEditable).assertEqual((metadata1.avQueueImage as PixelMap).isEditable);
        expect(data.duration).assertEqual(metadata1.duration);
        //expect((data.mediaImage as PixelMap).isEditable).assertEqual((metadata1.mediaImage as PixelMap).isEditable);
        expect(data.filter).assertEqual(metadata1.filter);
        expect(JSON.stringify(data.drmSchemes)).assertEqual(JSON.stringify(metadata1.drmSchemes));
        expect(data.skipIntervals).assertEqual(metadata1.skipIntervals);
        expect(data.displayTags).assertEqual(metadata1.displayTags);
      }).catch((err:BusinessError) => {
        console.info(`${TAG}TestLog: Business error occurred, error code: ${err.code}, message: ${err.message}`);
        expect(false).assertTrue();
      });

      await sleep(300);
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_PARAM_TRAVERSE_SETAVMETADATA_CALLBACK_0300
     * @tc.number SUB_MULTIMEDIA_AVSESSION_PARAM_TRAVERSE_SETAVMETADATA_CALLBACK_0300
     * @tc.desc   test setAVMetadata-callback & traverse all AVMetadata combinations: case 3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_PARAM_TRAVERSE_SETAVMETADATA_CALLBACK_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let TAG = '[SUB_MULTIMEDIA_AVSESSION_PARAM_TRAVERSE_SETAVMETADATA_CALLBACK_0300]';
      let metadata1: avSession.AVMetadata = {
        assetId : 'testId',
        title: "title",
        avQueueImage: "https://www.example.com/example.jpg",
        mediaImage: "https://www.example.com/example.jpg",
        filter: 8,
        drmSchemes: [],
        skipIntervals: 15,
      };

      session.setAVMetadata(metadata1, (err:BusinessError)=>{
        if(err){
          console.info(`${TAG}TestLog: Business error occurred, error code: ${err.code}, message: ${err.message}`);
          expect(false).assertTrue();
        } else {
          console.info(`${TAG}TestLog: setAVMetadata done.`);
        }
      });
      await sleep(300);

      await controller.getAVMetadata().then((data:avSession.AVMetadata) => {
        expect(data.assetId).assertEqual(metadata1.assetId);
        expect(data.title).assertEqual(metadata1.title);
        expect(data.avQueueImage).assertEqual(metadata1.avQueueImage);
        expect(data.mediaImage).assertEqual(metadata1.mediaImage);
        expect(data.filter).assertEqual(metadata1.filter);
        expect(JSON.stringify(data.drmSchemes)).assertEqual(JSON.stringify(metadata1.drmSchemes));
        expect(data.skipIntervals).assertEqual(metadata1.skipIntervals);
      }).catch((err:BusinessError) => {
        console.info(`${TAG}TestLog: Business error occurred, error code: ${err.code}, message: ${err.message}`);
        expect(false).assertTrue();
      });

      await sleep(300);
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_PARAM_TRAVERSE_SETAVMETADATA_CALLBACK_0400
     * @tc.number SUB_MULTIMEDIA_AVSESSION_PARAM_TRAVERSE_SETAVMETADATA_CALLBACK_0400
     * @tc.desc   test setAVMetadata-callback with invalid input param - other object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_PARAM_TRAVERSE_SETAVMETADATA_CALLBACK_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let TAG = '[SUB_MULTIMEDIA_AVSESSION_PARAM_TRAVERSE_SETAVMETADATA_CALLBACK_0400]';
      let callData : avSession.CallMetadata = {
        name: 'userName',
        phoneNumber: '65432111'
      }
      session.setAVMetadata(callData,(err:BusinessError)=>{
        if(err){
          console.info(`${TAG}TestLog: setAVMetadata error, error code: ${err.code}, message: ${err.message}`);
          expect(err.code).assertEqual(401);
        } else {
          expect(false).assertTrue();
        }
      });
      await sleep(300);
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_PARAM_TRAVERSE_SETAVMETADATA_CALLBACK_0500
     * @tc.number SUB_MULTIMEDIA_AVSESSION_PARAM_TRAVERSE_SETAVMETADATA_CALLBACK_0500
     * @tc.desc   test setAVMetadata-callback with invalid input param - invalid attribute
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_PARAM_TRAVERSE_SETAVMETADATA_CALLBACK_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let TAG = '[SUB_MULTIMEDIA_AVSESSION_PARAM_TRAVERSE_SETAVMETADATA_CALLBACK_0500]';
      interface MetaData {
        assetId : string,
        title : number
      }
      let metadata1: MetaData = {
        assetId : "123123123",
        title : 123123
      }
      session.setAVMetadata(metadata1,(err:BusinessError)=>{
        if(err){
          console.info(`${TAG}TestLog: setAVMetadata error, error code: ${err.code}, message: ${err.message}`);
          expect(err.code).assertEqual(401);
        } else {
          expect(false).assertTrue();
        }
      });
      await sleep(300);
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_PARAM_TRAVERSE_SETAVMETADATA_CALLBACK_0600
     * @tc.number SUB_MULTIMEDIA_AVSESSION_PARAM_TRAVERSE_SETAVMETADATA_CALLBACK_0600
     * @tc.desc   test setAVMetadata-callback with invalid input param - mandatory attributes lost
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_PARAM_TRAVERSE_SETAVMETADATA_CALLBACK_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let TAG = '[SUB_MULTIMEDIA_AVSESSION_PARAM_TRAVERSE_SETAVMETADATA_CALLBACK_0600]';
      interface MetaData {
        artist : string
      }
      let metadata1: MetaData = {
        artist: "artist"
      }
      session.setAVMetadata(metadata1,(err:BusinessError)=>{
        if(err){
          console.info(`${TAG}TestLog: setAVMetadata error, error code: ${err.code}, message: ${err.message}`);
          expect(err.code).assertEqual(6600101);
        } else {
          expect(false).assertTrue();
        }
      });
      await sleep(300);
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_PARAM_TRAVERSE_SETCALLMETADATA_PROMISE_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_PARAM_TRAVERSE_SETCALLMETADATA_PROMISE_0100
     * @tc.desc   test setCallMetadata-promise with invalid input param absent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_PARAM_TRAVERSE_SETCALLMETADATA_PROMISE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let TAG = '[SUB_MULTIMEDIA_AVSESSION_PARAM_TRAVERSE_SETCALLMETADATA_PROMISE_0100]';
      await session.setCallMetadata().then(() => {
        console.info(`${TAG}TestLog: setCallMetadata done.`);
        expect(false).assertTrue();
      }).catch((err:BusinessError) => {
        console.info(`${TAG}TestLog: setCallMetadata error, error code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(401);
      });
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_PARAM_TRAVERSE_SETCALLMETADATA_PROMISE_0200
     * @tc.number SUB_MULTIMEDIA_AVSESSION_PARAM_TRAVERSE_SETCALLMETADATA_PROMISE_0200
     * @tc.desc   test setCallMetadata-promise input param - invalid object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_PARAM_TRAVERSE_SETCALLMETADATA_PROMISE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let TAG = '[SUB_MULTIMEDIA_AVSESSION_PARAM_TRAVERSE_SETCALLMETADATA_PROMISE_0200]';
      await session.setCallMetadata(metadata0).then(() => {
        console.info(`${TAG}TestLog: setCallMetadata done.`);
        expect(false).assertTrue();
      }).catch((err:BusinessError) => {
        console.info(`${TAG}TestLog: setCallMetadata error, error code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(401);
      });
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_PARAM_TRAVERSE_SETCALLMETADATA_PROMISE_0300
     * @tc.number SUB_MULTIMEDIA_AVSESSION_PARAM_TRAVERSE_SETCALLMETADATA_PROMISE_0300
     * @tc.desc   test setCallMetadata-promise input param - invalid attribute
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_PARAM_TRAVERSE_SETCALLMETADATA_PROMISE_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let TAG = '[SUB_MULTIMEDIA_AVSESSION_PARAM_TRAVERSE_SETCALLMETADATA_PROMISE_0300]';
      interface CallData {
        name: string,
        phoneNumber: number
      }
      let call_data:CallData = {
        name: 'userName',
        phoneNumber: 65432111
      }
      await session.setCallMetadata(metadata0).then(() => {
        console.info(`${TAG}TestLog: setCallMetadata done.`);
        expect(false).assertTrue();
      }).catch((err:BusinessError) => {
        console.info(`${TAG}TestLog: setCallMetadata error, error code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(401);
      });
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_PARAM_SETAVMETADATA_PROMISE_SKIPINTERVALS_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_PARAM_SETAVMETADATA_PROMISE_SKIPINTERVALS_0100
     * @tc.desc   test setCallMetadata-promise input param with rewindSkipIntervals/forwardSkipIntervals only
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_PARAM_SETAVMETADATA_PROMISE_SKIPINTERVALS_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let TAG = '[SUB_MULTIMEDIA_AVSESSION_PARAM_SETAVMETADATA_PROMISE_SKIPINTERVALS_0100]';
      let metadata1: avSession.AVMetadata = {
        assetId : 'testId',
        rewindSkipIntervals:30,
        fastForwardSkipIntervals:10
      };

      await session.setAVMetadata(metadata1).then(() => {
        console.info(`${TAG}TestLog: setAVMetadata done.`);
      }).catch((err:BusinessError) => {
        console.info(`${TAG}TestLog: Business error occurred, error code: ${err.code}, message: ${err.message}`);
        expect(false).assertTrue();
      });

      await controller.getAVMetadata().then((data:avSession.AVMetadata) => {
        expect(data.rewindSkipIntervals).assertEqual(metadata1.rewindSkipIntervals);
        expect(data.fastForwardSkipIntervals).assertEqual(metadata1.fastForwardSkipIntervals);
      }).catch((err:BusinessError) => {
        console.info(`${TAG}TestLog: Business error occurred, error code: ${err.code}, message: ${err.message}`);
        expect(false).assertTrue();
      });

      await sleep(300);
      done();
    })



    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_PARAM_SETAVMETADATA_PROMISE_SKIPINTERVALS_0200
     * @tc.number SUB_MULTIMEDIA_AVSESSION_PARAM_SETAVMETADATA_PROMISE_SKIPINTERVALS_0200
     * @tc.desc   test setCallMetadata-promise input param with skipIntervals/rewindSkipIntervals/fastForwardSkipIntervals
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_PARAM_SETAVMETADATA_PROMISE_SKIPINTERVALS_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let TAG = '[SUB_MULTIMEDIA_AVSESSION_PARAM_SETAVMETADATA_PROMISE_SKIPINTERVALS_0200]';
      let metadata1: avSession.AVMetadata = {
        assetId : 'testId111',
        skipIntervals: 30,
        rewindSkipIntervals:10,
        fastForwardSkipIntervals:15
      };

      let metadata2: avSession.AVMetadata = {
        assetId : 'testId123',
        skipIntervals: 10,
        rewindSkipIntervals:15,
        fastForwardSkipIntervals:30
      };

      await session.setAVMetadata(metadata1).then(() => {
        console.info(`${TAG}TestLog: setAVMetadata done.`);
      }).catch((err:BusinessError) => {
        console.info(`${TAG}TestLog: Business error occurred, error code: ${err.code}, message: ${err.message}`);
        expect(false).assertTrue();
      });

      await controller.getAVMetadata().then((data:avSession.AVMetadata) => {
        expect(data.skipIntervals).assertEqual(metadata1.skipIntervals);
        expect(data.rewindSkipIntervals).assertEqual(metadata1.rewindSkipIntervals);
        expect(data.fastForwardSkipIntervals).assertEqual(metadata1.fastForwardSkipIntervals);
      }).catch((err:BusinessError) => {
        console.info(`${TAG}TestLog: Business error occurred, error code: ${err.code}, message: ${err.message}`);
        expect(false).assertTrue();
      });

      await sleep(300);

      await session.setAVMetadata(metadata2).then(() => {
        console.info(`${TAG}TestLog: setAVMetadata done.`);
      }).catch((err:BusinessError) => {
        console.info(`${TAG}TestLog: Business error occurred, error code: ${err.code}, message: ${err.message}`);
        expect(false).assertTrue();
      });

      await controller.getAVMetadata().then((data:avSession.AVMetadata) => {
        expect(data.skipIntervals).assertEqual(metadata2.skipIntervals);
        expect(data.rewindSkipIntervals).assertEqual(metadata2.rewindSkipIntervals);
        expect(data.fastForwardSkipIntervals).assertEqual(metadata2.fastForwardSkipIntervals);
      }).catch((err:BusinessError) => {
        console.info(`${TAG}TestLog: Business error occurred, error code: ${err.code}, message: ${err.message}`);
        expect(false).assertTrue();
      });

      await sleep(300);
      done();
    })


  })
}





