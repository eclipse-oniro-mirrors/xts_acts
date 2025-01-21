/*
 * Copyright (C) 2023 Huawei Device Co., Ltd.
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

// @ts-nocheck
import mediaLibrary from '@ohos.multimedia.mediaLibrary';
import DateTimeUtil from './DateTimeUtil';
import photoAccessHelper from '@ohos.file.photoAccessHelper';
import fs from '@ohos.file.fs';

export default class MediaUtils {
    private static instance: MediaUtils = new MediaUtils();

    public static getInstance() {
        if (this.instance === undefined) {
            this.instance = new MediaUtils();
        }
        return this.instance;
    }

    async createAndGetUri(mediaType: number, mContext) {
        console.info('1128xmj createAndGetUri');
        let info = this.getInfoFromType(mediaType);
        let dateTimeUtil = new DateTimeUtil();
        let name = `${dateTimeUtil.getDate()}_${dateTimeUtil.getTime()}`;
        let displayName = `${info.prefix}${name}${info.suffix}`;
        console.info('1128xmj createAndGetUri displayName : ' + displayName);

        let phAccessHelper:photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(mContext);
        let photoAsset = await phAccessHelper.createAsset(displayName);
        let fd = await photoAsset.open('Rw');
        return fd;
    }

    async createAndGetUriVideo(mediaType: number, mContext) {
        console.info('1128xmj createAndGetUriVideo');
        let info = this.getInfoFromType(mediaType)
        let dateTimeUtil = new DateTimeUtil()
        let name = `${dateTimeUtil.getDate()}_${dateTimeUtil.getTime()}`
        let tmp = `/`
        let displayName = `${tmp}${info.prefix}${name}${info.suffix}`
        console.info('1128xmj createAndGetUri displayName : ' + displayName);

        let filesDirPath  = mContext.filesDir + displayName;
        console.info('1128xmj createAndGetUri filesDirPath : ' + JSON.stringify(filesDirPath));
        let file = fs.openSync(filesDirPath , fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
        console.info('1128xmj fd : ' + file.fd);
        return file.fd;
    }

    // 照片格式
    onChangePhotoFormat() {
        if (globalThis.settingDataObj.photoFormat == 0) {
            return 'png';
        }
        if (globalThis.settingDataObj.photoFormat == 1) {
            return 'jpg';
        }
        if (globalThis.settingDataObj.photoFormat == 2) {
            return 'bmp';
        }
        if (globalThis.settingDataObj.photoFormat == 3) {
            return 'webp';
        }
        if (globalThis.settingDataObj.photoFormat == 4) {
            return 'jpeg';
        }
    }

    getInfoFromType(mediaType: number) {
        let result = {
            prefix: '', suffix: '', directory: 0
        }
        switch (mediaType) {
            case mediaLibrary.MediaType.FILE:
                result.prefix = 'FILE_';
                result.suffix = '.txt';
                result.directory = mediaLibrary.DirectoryType.DIR_DOCUMENTS;
                break
            case mediaLibrary.MediaType.IMAGE:
                result.prefix = 'IMG_';
                // result.suffix =  '.jpg';
                result.suffix = `.${this.onChangePhotoFormat()}`;
                result.directory = mediaLibrary.DirectoryType.DIR_CAMERA;
                break;
            case mediaLibrary.MediaType.VIDEO:
                result.prefix = 'VID_';
                result.suffix = '.mp4';
                result.directory = mediaLibrary.DirectoryType.DIR_CAMERA;
                break;
            case mediaLibrary.MediaType.AUDIO:
                result.prefix = 'AUD_';
                result.suffix = '.wav';
                result.directory = mediaLibrary.DirectoryType.DIR_AUDIO;
                break;
        }
        return result;
    }
}