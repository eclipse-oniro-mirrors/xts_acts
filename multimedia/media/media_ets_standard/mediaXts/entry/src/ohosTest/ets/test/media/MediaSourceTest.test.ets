/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level } from "@ohos/hypium";
import { media } from "@kit.MediaKit";
import MediaTestBase from "./MediaTestBase";
import { HashMap } from "@kit.ArkTS";
import { LOG_TAG } from "../Constants";

const TAG = LOG_TAG + 'MediaSourceTest';
const VIDEO_SOURCE = 'H264_AAC.m3u8';

let mediaTestBase = new MediaTestBase();
let fileDescriptor: media.AVFileDescriptor;
let mMediaSource: media.MediaSource | undefined;
let headers: Record<string, string> = { "User-Agent": "User-Agent-Value" };
let uuid: number = 1;
let requests: HashMap<number, media.MediaSourceLoadingRequest> = new HashMap();

function openFileFailed() {
  console.info(TAG, 'openFileFailed case file fail');
}

function getUrl(descriptor: media.AVFileDescriptor): string {
  let fd: string = descriptor.fd.toString();
  let offset: string = descriptor.offset!.toString();
  let length: string = descriptor.length!.toString();
  let url: string = "fd://" + fd + "?offset=" + offset + "&size=" + length;
  console.info(TAG, 'file url: ' + url);
  return url;
}

async function createMediaSourceWithUrl(testName: string) {
  console.info(TAG, testName + ' begin.');
  let url: string = getUrl(fileDescriptor);
  mMediaSource = media.createMediaSourceWithUrl(url, headers);
  console.info(TAG, testName + ' Succeeded in create MediaSourceWithUrl. mediaSource: ' + JSON.stringify(mMediaSource));
  expect(mMediaSource).not().assertUndefined();
}

function setMimeType(done: Function, testName: string, mimeType: media.AVMimeTypes) {
  console.info(TAG, testName + ' begin.');
  try {
    if (mMediaSource !== undefined) {
      mMediaSource.setMimeType(mimeType);
      console.info(TAG, testName + ' Succeeded in set MimeType.');
      expect(true).assertTrue();
    }
    done();
  } catch (error) {
    console.error(TAG, testName + ' Failed to set MimeType, code: ' + error.code + ', msg: ' + error.message);
    expect().assertFail();
    done();
  }
}

function setMediaResourceLoaderDelegate(done: Function, testName: string) {
  console.info(TAG, testName + ' begin.');
  let resourceLoader: media.MediaSourceLoader = {
    open: sourceOpenCallback,
    read: sourceReadCallback,
    close: sourceCloseCallback
  };
  try {
    if (mMediaSource !== undefined) {
      mMediaSource.setMediaResourceLoaderDelegate(resourceLoader);
      console.info(TAG, testName + ' Succeeded in set MediaResourceLoaderDelegate.');
      expect(true).assertTrue();
    }
    done();
  } catch (error) {
    console.error(TAG,
      testName + ' Failed to set MediaResourceLoaderDelegate, code: ' + error.code + ', msg: ' + error.message);
    expect().assertFail();
    done();
  }
}

let sourceOpenCallback: media.SourceOpenCallback = (request: media.MediaSourceLoadingRequest) => {
  console.info(TAG, 'Opening resource: ' + request.url);
  uuid += 1;
  requests.set(uuid, request);
  return uuid;
}

let sourceReadCallback: media.SourceReadCallback = (uuid: number, requestedOffset: number, requestedLength: number) => {
  console.info(TAG,
    'Reading resource with handle: ' + uuid + ', offset: ' + requestedOffset + ', length: ' + requestedLength);
}

let sourceCloseCallback: media.SourceCloseCallback = (uuid: number) => {
  console.info(TAG, 'Closing resource with handle: ' + uuid);
  requests.remove(uuid);
}

export default function MediaSourceTest() {
  describe('MediaSourceTest', () => {
    beforeAll(async () => {
      console.info(TAG, 'beforeAll case');
      await mediaTestBase.getFileDescriptorFromFileDir(VIDEO_SOURCE, openFileFailed).then((res) => {
        fileDescriptor = res;
      });
    });

    beforeEach(async () => {
      console.info(TAG, 'beforeEach case');
    });

    afterEach(async () => {
      console.info(TAG, 'afterEach case');
    });

    afterAll(async () => {
      console.info(TAG, 'afterAll case');
      await mediaTestBase.closeFdNumber(fileDescriptor.fd);
    });

    /**
     * @tc.number    : MEDIA_SOURCE_TEST_001
     * @tc.name      : createMediaSourceWithUrl_001
     * @tc.desc      : Test normal scene of create MediaSourceWithUrl
     * @tc.size      : MediumTest
     * @tc.type      : Function test
     * @tc.level     : Level0
     */
    it('createMediaSourceWithUrl_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'createMediaSourceWithUrl_001';
      createMediaSourceWithUrl(testName);
      done();
    })

    /**
     * @tc.number    : MEDIA_SOURCE_TEST_002
     * @tc.name      : setMimeType_001
     * @tc.desc      : Test normal scene of set MimeType
     * @tc.size      : MediumTest
     * @tc.type      : Function test
     * @tc.level     : Level0
     */
    it('setMimeType_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'setMimeType_001';
      let mimeType: media.AVMimeTypes = media.AVMimeTypes.APPLICATION_M3U8;
      createMediaSourceWithUrl(testName);
      setMimeType(done, testName, mimeType);
    })

    /**
     * @tc.number    : MEDIA_SOURCE_TEST_003
     * @tc.name      : setMediaResourceLoaderDelegate_001
     * @tc.desc      : Test normal scene of set MediaResourceLoaderDelegate
     * @tc.size      : MediumTest
     * @tc.type      : Function test
     * @tc.level     : Level0
     */
    it('setMediaResourceLoaderDelegate_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'setMediaResourceLoaderDelegate_001';
      createMediaSourceWithUrl(testName);
      setMediaResourceLoaderDelegate(done, testName);
    })
  })
}