/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium'
import drm from '@ohos.multimedia.drm';

export default function drmEnumTest() {
    describe('drmEnumTest', () => {
        beforeAll(async () => {
            console.log("beforeAll");
        });
        beforeEach(() => {
            console.log("beforeEach");
        });
        afterEach(() => {
            console.log("afterEach");
        });
        afterAll(() => {
            console.log("afterAll");
        });
        /**
         * @tc.name   SUB_MULTIMEDIA_DRM_CERTIFICATE_STATUS_ENUM_0100
         * @tc.number SUB_MULTIMEDIA_DRM_CERTIFICATE_STATUS_ENUM_0100
         * @tc.desc   test all CertificateStatus
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_DRM_CERTIFICATE_STATUS_ENUM_0100', Level.LEVEL0, (done: Function) => {
            expect(drm.CertificateStatus.CERT_STATUS_PROVISIONED == 0).assertTrue();
            console.log(`drm.CertificateStatus.CERT_STATUS_PROVISIONED: ${drm.CertificateStatus.CERT_STATUS_PROVISIONED}`);
            expect(drm.CertificateStatus.CERT_STATUS_NOT_PROVISIONED == 1).assertTrue();
            console.log(`drm.CertificateStatus.CERT_STATUS_NOT_PROVISIONED: ${drm.CertificateStatus.CERT_STATUS_NOT_PROVISIONED}`);
            expect(drm.CertificateStatus.CERT_STATUS_EXPIRED == 2).assertTrue();
            console.log(`drm.CertificateStatus.CERT_STATUS_EXPIRED: ${drm.CertificateStatus.CERT_STATUS_EXPIRED}`);
            expect(drm.CertificateStatus.CERT_STATUS_INVALID == 3).assertTrue();
            console.log(`drm.CertificateStatus.CERT_STATUS_INVALID: ${drm.CertificateStatus.CERT_STATUS_INVALID}`);
            expect(drm.CertificateStatus.CERT_STATUS_UNAVAILABLE == 4).assertTrue();
            console.log(`drm.CertificateStatus.CERT_STATUS_UNAVAILABLE: ${drm.CertificateStatus.CERT_STATUS_UNAVAILABLE}`);
            done();
        });
        /**
         * @tc.name   SUB_MULTIMEDIA_DRM_MEDIA_KEY_REQUEST_TYPE_ENUM_0100
         * @tc.number SUB_MULTIMEDIA_DRM_MEDIA_KEY_REQUEST_TYPE_ENUM_0100
         * @tc.desc   test all MediaKeyRequestType
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_DRM_MEDIA_KEY_REQUEST_TYPE_ENUM_0100', Level.LEVEL0, (done: Function) => {
            expect(drm.MediaKeyRequestType.MEDIA_KEY_REQUEST_TYPE_UNKNOWN == 0).assertTrue();
            console.log(`drm.MediaKeyRequestType.MEDIA_KEY_REQUEST_TYPE_UNKNOWN: ${drm.MediaKeyRequestType.MEDIA_KEY_REQUEST_TYPE_UNKNOWN}`);
            expect(drm.MediaKeyRequestType.MEDIA_KEY_REQUEST_TYPE_INITIAL == 1).assertTrue();
            console.log(`drm.MediaKeyRequestType.MEDIA_KEY_REQUEST_TYPE_INITIAL: ${drm.MediaKeyRequestType.MEDIA_KEY_REQUEST_TYPE_INITIAL}`);
            expect(drm.MediaKeyRequestType.MEDIA_KEY_REQUEST_TYPE_RENEWAL == 2).assertTrue();
            console.log(`drm.MediaKeyRequestType.MEDIA_KEY_REQUEST_TYPE_RENEWAL : ${drm.MediaKeyRequestType.MEDIA_KEY_REQUEST_TYPE_RENEWAL}`);
            expect(drm.MediaKeyRequestType.MEDIA_KEY_REQUEST_TYPE_RELEASE == 3).assertTrue();
            console.log(`drm.MediaKeyRequestType.MEDIA_KEY_REQUEST_TYPE_RELEASE: ${drm.MediaKeyRequestType.MEDIA_KEY_REQUEST_TYPE_RELEASE}`);
            expect(drm.MediaKeyRequestType.MEDIA_KEY_REQUEST_TYPE_NONE == 4).assertTrue();
            console.log(`drm.MediaKeyRequestType.MEDIA_KEY_REQUEST_TYPE_NONE: ${drm.MediaKeyRequestType.MEDIA_KEY_REQUEST_TYPE_NONE}`);
            expect(drm.MediaKeyRequestType.MEDIA_KEY_REQUEST_TYPE_UPDATE == 5).assertTrue();
            console.log(`drm.MediaKeyRequestType.MEDIA_KEY_REQUEST_TYPE_UPDATE : ${drm.MediaKeyRequestType.MEDIA_KEY_REQUEST_TYPE_UPDATE}`);
            done();
        });
        /**
         * @tc.name   SUB_MULTIMEDIA_DRM_ERROR_CODE_ENUM_0100
         * @tc.number SUB_MULTIMEDIA_DRM_ERROR_CODE_ENUM_0100
         * @tc.desc   test all DrmErrorCode
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_DRM_ERROR_CODE_ENUM_0100', Level.LEVEL0, (done: Function) => {
            expect(drm.DrmErrorCode.ERROR_UNKNOWN == 24700101).assertTrue();
            console.log(`drm.DrmErrorCode.ERROR_UNKNOWN: ${drm.DrmErrorCode.ERROR_UNKNOWN}`);
            expect(drm.DrmErrorCode.MAX_SYSTEM_NUM_REACHED == 24700103).assertTrue();
            console.log(`drm.DrmErrorCode.MAX_SYSTEM_NUM_REACHED: ${drm.DrmErrorCode.MAX_SYSTEM_NUM_REACHED}`);
            expect(drm.DrmErrorCode.MAX_SESSION_NUM_REACHED == 24700104).assertTrue();
            console.log(`drm.DrmErrorCode.MAX_SESSION_NUM_REACHED : ${drm.DrmErrorCode.MAX_SESSION_NUM_REACHED}`);
            expect(drm.DrmErrorCode.SERVICE_FATAL_ERROR == 24700201).assertTrue();
            console.log(`drm.DrmErrorCode.SERVICE_FATAL_ERROR  : ${drm.DrmErrorCode.SERVICE_FATAL_ERROR}`);
            done();
        });
        /**
         * @tc.name   SUB_MULTIMEDIA_DRM_PREDEFINED_CONFIG_NAME_ENUM_0100
         * @tc.number SUB_MULTIMEDIA_DRM_PREDEFINED_CONFIG_NAME_ENUM_0100
         * @tc.desc   test all PreDefinedConfigName
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_DRM_PREDEFINED_CONFIG_NAME_ENUM_0100', Level.LEVEL0, (done: Function) => {
            expect(drm.PreDefinedConfigName.CONFIG_DEVICE_VENDOR == 'vendor').assertTrue();
            console.log(`drm.PreDefinedConfigName.CONFIG_DEVICE_VENDOR: ${drm.PreDefinedConfigName.CONFIG_DEVICE_VENDOR}`);
            expect(drm.PreDefinedConfigName.CONFIG_DEVICE_VERSION == 'version').assertTrue();
            console.log(`drm.PreDefinedConfigName.CONFIG_DEVICE_VERSION : ${drm.PreDefinedConfigName.CONFIG_DEVICE_VERSION}`);
            expect(drm.PreDefinedConfigName.CONFIG_DEVICE_DESCRIPTION == 'description').assertTrue();
            console.log(`drm.PreDefinedConfigName.CONFIG_DEVICE_DESCRIPTION : ${drm.PreDefinedConfigName.CONFIG_DEVICE_DESCRIPTION}`);
            expect(drm.PreDefinedConfigName.CONFIG_DEVICE_ALGORITHMS == 'algorithms').assertTrue();
            console.log(`drm.PreDefinedConfigName.CONFIG_DEVICE_ALGORITHMS : ${drm.PreDefinedConfigName.CONFIG_DEVICE_ALGORITHMS}`);
            expect(drm.PreDefinedConfigName.CONFIG_DEVICE_UNIQUE_ID == 'deviceUniqueId').assertTrue();
            console.log(`drm.PreDefinedConfigName.CONFIG_DEVICE_UNIQUE_ID  : ${drm.PreDefinedConfigName.CONFIG_DEVICE_UNIQUE_ID}`);
            expect(drm.PreDefinedConfigName.CONFIG_SESSION_MAX == 'maxSessionNum').assertTrue();
            console.log(`drm.PreDefinedConfigName.CONFIG_SESSION_MAX  : ${drm.PreDefinedConfigName.CONFIG_SESSION_MAX}`);
            expect(drm.PreDefinedConfigName.CONFIG_SESSION_CURRENT == 'currentSessionNum').assertTrue();
            console.log(`drm.PreDefinedConfigName.CONFIG_SESSION_CURRENT: ${drm.PreDefinedConfigName.CONFIG_SESSION_CURRENT}`);
            done();
        });
        /**
         * @tc.name   SUB_MULTIMEDIA_DRM_MEDIA_KEY_TYPE_ENUM_0100
         * @tc.number SUB_MULTIMEDIA_DRM_MEDIA_KEY_TYPE_ENUM_0100
         * @tc.desc   test all MediaKeyType
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_DRM_MEDIA_KEY_TYPE_ENUM_0100', Level.LEVEL0, (done: Function) => {
            expect(drm.MediaKeyType.MEDIA_KEY_TYPE_OFFLINE == 0).assertTrue();
            console.log(`drm.MediaKeyType.MEDIA_KEY_TYPE_OFFLINE: ${drm.MediaKeyType.MEDIA_KEY_TYPE_OFFLINE}`);
            expect(drm.MediaKeyType.MEDIA_KEY_TYPE_ONLINE == 1).assertTrue();
            console.log(`drm.MediaKeyType.MEDIA_KEY_TYPE_ONLINE: ${drm.MediaKeyType.MEDIA_KEY_TYPE_ONLINE}`);
            done();
        });
        /**
         * @tc.name   SUB_MULTIMEDIA_DRM_OFFLINE_MEDIA_KEY_STATUS_ENUM_0100
         * @tc.number SUB_MULTIMEDIA_DRM_OFFLINE_MEDIA_KEY_STATUS_ENUM_0100
         * @tc.desc   test all OfflineMediaKeyStatus
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_DRM_OFFLINE_MEDIA_KEY_STATUS_ENUM_0100', Level.LEVEL0, (done: Function) => {
            expect(drm.OfflineMediaKeyStatus.OFFLINE_MEDIA_KEY_STATUS_UNKNOWN == 0).assertTrue();
            console.log(`drm.OfflineMediaKeyStatus.OFFLINE_MEDIA_KEY_STATUS_UNKNOWN: ${drm.OfflineMediaKeyStatus.OFFLINE_MEDIA_KEY_STATUS_UNKNOWN}`);
            expect(drm.OfflineMediaKeyStatus.OFFLINE_MEDIA_KEY_STATUS_USABLE == 1).assertTrue();
            console.log(`drm.OfflineMediaKeyStatus.OFFLINE_MEDIA_KEY_STATUS_USABLE : ${drm.OfflineMediaKeyStatus.OFFLINE_MEDIA_KEY_STATUS_USABLE}`);
            expect(drm.OfflineMediaKeyStatus.OFFLINE_MEDIA_KEY_STATUS_INACTIVE == 2).assertTrue();
            console.log(`drm.OfflineMediaKeyStatus.OFFLINE_MEDIA_KEY_STATUS_INACTIVE  : ${drm.OfflineMediaKeyStatus.OFFLINE_MEDIA_KEY_STATUS_INACTIVE}`);
            done();
        });
        /**
         * @tc.name   SUB_MULTIMEDIA_DRM_CONTENT_PROTECTION_LEVEL_ENUM_0100
         * @tc.number SUB_MULTIMEDIA_DRM_CONTENT_PROTECTION_LEVEL_ENUM_0100
         * @tc.desc   test all ContentProtectionLevel
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_DRM_CONTENT_PROTECTION_LEVEL_ENUM_0100', Level.LEVEL0, (done: Function) => {
            expect(drm.ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_UNKNOWN == 0).assertTrue();
            console.log(`drm.ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_UNKNOWN: ${drm.ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_UNKNOWN}`);
            expect(drm.ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_SW_CRYPTO == 1).assertTrue();
            console.log(`drm.ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_SW_CRYPTO: ${drm.ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_SW_CRYPTO}`);
            expect(drm.ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_HW_CRYPTO == 2).assertTrue();
            console.log(`drm.ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_HW_CRYPTO: ${drm.ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_HW_CRYPTO}`);
            expect(drm.ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_ENHANCED_HW == 3).assertTrue();
            console.log(`drm.ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_ENHANCED_HW: ${drm.ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_ENHANCED_HW}`);
            expect(drm.ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_MAX == 4).assertTrue();
            console.log(`drm.ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_MAX: ${drm.ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_MAX}`);
            done();
        });
    })
}