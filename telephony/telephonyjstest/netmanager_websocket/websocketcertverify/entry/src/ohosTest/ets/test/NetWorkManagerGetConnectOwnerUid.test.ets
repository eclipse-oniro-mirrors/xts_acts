/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import connection from '@ohos.net.connection';
import { BusinessError } from '@ohos.base';
import { hilog } from '@kit.PerformanceAnalysisKit';

const TAG = 'NetWorkManagerGetConnectOwnerUid';
const DOMAIN = 0x0000;

// Family
const FAMILY_IPV4 = 1;
const FAMILY_IPV6 = 2;

export default function NetWorkManagerGetConnectOwnerUid() {
  describe('GetConnectOwnerUid_Test', () => {
    // ==================== TCP IPv4 test cases ====================
    /**
     * @tc.name    testNetManagerBaseGetConnectOwnerUid0600
     * @tc.number  SUB_NetMgrBase_GetConnect_OwnerUid_0600
     * @tc.desc    Test error code 2100001 with invalid IP format
     * @tc.type    FUNCTION
     * @tc.size    LARGETEST
     * @tc.level   LEVEL1
     */
    it('testNetManagerBaseGetConnectOwnerUid0600', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL1, async (done: Function) => {
      try {
        let uid = await connection.getConnectOwnerUid(
          connection.ProtocolType.PROTO_TYPE_TCP,
          { address: '999.999.999.999', family: FAMILY_IPV4, port: 12345 },
          { address: '999.999.999.999', family: FAMILY_IPV4, port: 54321 }
        );
        hilog.info(DOMAIN, TAG, '[TCP_IPv4_InvalidIpFormat] uid=%{public}d', uid);
        expect().assertFail();
        done();
      } catch (err) {
        let error = err as BusinessError;
        hilog.info(DOMAIN, TAG, '[TCP_IPv4_InvalidIpFormat] error: code=%{public}d', error.code);
        expect(Number(error.code)).assertEqual(2100001);
        done();
      }
    });

    /**
     * @tc.name    testNetManagerBaseGetConnectOwnerUid0700
     * @tc.number  SUB_NetMgrBase_GetConnect_OwnerUid_0700
     * @tc.desc    Test error code 2100001 with empty address
     * @tc.type    FUNCTION
     * @tc.size    LARGETEST
     * @tc.level   LEVEL1
     */
    it('testNetManagerBaseGetConnectOwnerUid0700', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL1, async (done: Function) => {
      try {
        let uid = await connection.getConnectOwnerUid(
          connection.ProtocolType.PROTO_TYPE_TCP,
          { address: '', family: FAMILY_IPV4, port: 12345 },
          { address: '', family: FAMILY_IPV4, port: 54321 }
        );
        hilog.info(DOMAIN, TAG, '[TCP_IPv4_EmptyAddr] uid=%{public}d', uid);
        expect().assertFail();
        done();
      } catch (err) {
        let error = err as BusinessError;
        hilog.info(DOMAIN, TAG, '[TCP_IPv4_EmptyAddr] error: code=%{public}d', error.code);
        expect(Number(error.code)).assertEqual(2100001);
        done();
      }
    });

    /**
     * @tc.name    testNetManagerBaseGetConnectOwnerUid0701
     * @tc.number  SUB_NetMgrBase_GetConnect_OwnerUid_0701
     * @tc.desc    Test error code 2100001 with invalid port -1
     * @tc.type    FUNCTION
     * @tc.size    LARGETEST
     * @tc.level   LEVEL1
     */
    it('testNetManagerBaseGetConnectOwnerUid0701', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL1, async (done: Function) => {
      try {
        let uid = await connection.getConnectOwnerUid(
          connection.ProtocolType.PROTO_TYPE_TCP,
          { address: '192.168.1.100', family: FAMILY_IPV4, port: -1 },
          { address: '192.168.1.200', family: FAMILY_IPV4, port: -1 }
        );
        hilog.info(DOMAIN, TAG, '[TCP_IPv4_Invalid_Port] uid=%{public}d', uid);
        expect().assertFail();
        done();
      } catch (err) {
        let error = err as BusinessError;
        hilog.info(DOMAIN, TAG, '[TCP_IPv4_Invalid_Port] error: code=%{public}d', error.code);
        expect(Number(error.code)).assertEqual(2100001);
        done();
      }
    });

    /**
     * @tc.name    testNetManagerBaseGetConnectOwnerUid0800
     * @tc.number  SUB_NetMgrBase_GetConnect_OwnerUid_0800
     * @tc.desc    Test error code 2100001 with invalid port 65536
     * @tc.type    FUNCTION
     * @tc.size    LARGETEST
     * @tc.level   LEVEL1
     */
    it('testNetManagerBaseGetConnectOwnerUid0800', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL1, async (done: Function) => {
      try {
        let uid = await connection.getConnectOwnerUid(
          connection.ProtocolType.PROTO_TYPE_TCP,
          { address: '127.0.0.1', family: FAMILY_IPV4, port: 65536 },
          { address: '127.0.0.1', family: FAMILY_IPV4, port: 65536 }
        );
        hilog.info(DOMAIN, TAG, '[TCP_IPv4_InvalidPort] uid=%{public}d', uid);
        expect().assertFail();
        done();
      } catch (err) {
        let error = err as BusinessError;
        hilog.info(DOMAIN, TAG, '[TCP_IPv4_InvalidPort] error: code=%{public}d', error.code);
        expect(Number(error.code)).assertEqual(2100001);
        done();
      }
    });

    /**
     * @tc.name    testNetManagerBaseGetConnectOwnerUid1200
     * @tc.number  SUB_NetMgrBase_GetConnect_OwnerUid_1200
     * @tc.desc    Test sync API error code 2100001 with invalid IP format
     * @tc.type    FUNCTION
     * @tc.size    LARGETEST
     * @tc.level   LEVEL1
     */
    it('testNetManagerBaseGetConnectOwnerUid1200', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL1, async (done: Function) => {
      try {
        let uid = connection.getConnectOwnerUidSync(
          connection.ProtocolType.PROTO_TYPE_TCP,
          { address: '999.999.999.999', family: FAMILY_IPV4, port: 12345 },
          { address: '999.999.999.999', family: FAMILY_IPV4, port: 54321 }
        );
        hilog.info(DOMAIN, TAG, '[TCP_IPv4_Sync_InvalidIpFormat] uid=%{public}d', uid);
        expect().assertFail();
        done();
      } catch (err) {
        let error = err as BusinessError;
        hilog.info(DOMAIN, TAG, '[TCP_IPv4_Sync_InvalidIpFormat] error: code=%{public}d', error.code);
        expect(Number(error.code)).assertEqual(2100001);
        done();
      }
    });

    /**
     * @tc.name    testNetManagerBaseGetConnectOwnerUid1300
     * @tc.number  SUB_NetMgrBase_GetConnect_OwnerUid_1300
     * @tc.desc    Test sync API error handling with invalid address tuple
     * @tc.type    FUNCTION
     * @tc.size    LARGETEST
     * @tc.level   LEVEL1
     */
    it('testNetManagerBaseGetConnectOwnerUid1300', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL1, async (done: Function) => {
      try {
        let uid = connection.getConnectOwnerUidSync(
          connection.ProtocolType.PROTO_TYPE_TCP,
          { address: '192.168.255.255', family: FAMILY_IPV4, port: 99999 },
          { address: '10.255.255.255', family: FAMILY_IPV4, port: 12345 }
        );
        hilog.info(DOMAIN, TAG, '[TCP_IPv4_Sync_InvalidAddr] uid=%{public}d', uid);
        expect().assertFail();
        done();
      } catch (err) {
        let error = err as BusinessError;
        hilog.info(DOMAIN, TAG, '[TCP_IPv4_Sync_InvalidAddr] error: code=%{public}d', error.code);
        expect(Number(error.code)).assertEqual(2100001);
        done();
      }
    });

    /**
     * @tc.name    testNetManagerBaseGetConnectOwnerUid1400
     * @tc.number  SUB_NetMgrBase_GetConnect_OwnerUid_1400
     * @tc.desc    Test sync API error code 2100001 with empty address
     * @tc.type    FUNCTION
     * @tc.size    LARGETEST
     * @tc.level   LEVEL1
     */
    it('testNetManagerBaseGetConnectOwnerUid1400', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL1, async (done: Function) => {
      try {
        let uid = connection.getConnectOwnerUidSync(
          connection.ProtocolType.PROTO_TYPE_TCP,
          { address: '', family: FAMILY_IPV4, port: 12345 },
          { address: '', family: FAMILY_IPV4, port: 54321 }
        );
        hilog.info(DOMAIN, TAG, '[TCP_IPv4_Sync_EmptyAddr] uid=%{public}d', uid);
        expect().assertFail();
        done();
      } catch (err) {
        let error = err as BusinessError;
        hilog.info(DOMAIN, TAG, '[TCP_IPv4_Sync_EmptyAddr] error: code=%{public}d', error.code);
        expect(Number(error.code)).assertEqual(2100001);
        done();
      }
    });

    /**
     * @tc.name    testNetManagerBaseGetConnectOwnerUid1401
     * @tc.number  SUB_NetMgrBase_GetConnect_OwnerUid_1401
     * @tc.desc    Test error code 2100001 with invalid port -1
     * @tc.type    FUNCTION
     * @tc.size    LARGETEST
     * @tc.level   LEVEL1
     */
    it('testNetManagerBaseGetConnectOwnerUid1401', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL1, async (done: Function) => {
      try {
        let uid = connection.getConnectOwnerUidSync(
          connection.ProtocolType.PROTO_TYPE_TCP,
          { address: '192.168.1.100', family: FAMILY_IPV4, port: -1 },
          { address: '192.168.1.200', family: FAMILY_IPV4, port: -1 }
        );
        hilog.info(DOMAIN, TAG, '[TCP_IPv4_Invalid_Port] uid=%{public}d', uid);
        expect().assertFail();
        done();
      } catch (err) {
        let error = err as BusinessError;
        hilog.info(DOMAIN, TAG, '[TCP_IPv4_Invalid_Port] error: code=%{public}d', error.code);
        expect(Number(error.code)).assertEqual(2100001);
        done();
      }
    });

    /**
     * @tc.name    testNetManagerBaseGetConnectOwnerUid1402
     * @tc.number  SUB_NetMgrBase_GetConnect_OwnerUid_1402
     * @tc.desc    Test error code 2100001 with invalid port 65536
     * @tc.type    FUNCTION
     * @tc.size    LARGETEST
     * @tc.level   LEVEL1
     */
    it('testNetManagerBaseGetConnectOwnerUid1402', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL1, async (done: Function) => {
      try {
        let uid = connection.getConnectOwnerUidSync(
          connection.ProtocolType.PROTO_TYPE_TCP,
          { address: '127.0.0.1', family: FAMILY_IPV4, port: 65536 },
          { address: '127.0.0.1', family: FAMILY_IPV4, port: 65536 }
        );
        hilog.info(DOMAIN, TAG, '[TCP_IPv4_InvalidPort] uid=%{public}d', uid);
        expect().assertFail();
        done();
      } catch (err) {
        let error = err as BusinessError;
        hilog.info(DOMAIN, TAG, '[TCP_IPv4_InvalidPort] error: code=%{public}d', error.code);
        expect(Number(error.code)).assertEqual(2100001);
        done();
      }
    });

    // ==================== TCP IPv6 test cases ====================
    /**
     * @tc.name    testNetManagerBaseGetConnectOwnerUid1900
     * @tc.number  SUB_NetMgrBase_GetConnect_OwnerUid_1900
     * @tc.desc    Test error handling with invalid IPv6 address tuple
     * @tc.type    FUNCTION
     * @tc.size    LARGETEST
     * @tc.level   LEVEL1
     */
    it('testNetManagerBaseGetConnectOwnerUid1900', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL1, async (done: Function) => {
      try {
        let uid = await connection.getConnectOwnerUid(
          connection.ProtocolType.PROTO_TYPE_TCP,
          { address: '2001:db8::ffff', family: FAMILY_IPV6, port: 99999 },
          { address: '2001:db8::1', family: FAMILY_IPV6, port: 12345 }
        );
        hilog.info(DOMAIN, TAG, '[TCP_IPv6_InvalidAddr] uid=%{public}d', uid);
        expect().assertFail();
        done();
      } catch (err) {
        let error = err as BusinessError;
        hilog.info(DOMAIN, TAG, '[TCP_IPv6_InvalidAddr] error: code=%{public}d', error.code);
        expect(Number(error.code)).assertEqual(2100001);
        done();
      }
    });

    /**
     * @tc.name    testNetManagerBaseGetConnectOwnerUid2000
     * @tc.number  SUB_NetMgrBase_GetConnect_OwnerUid_2000
     * @tc.desc    Test error code 2100001 with invalid IPv6 format
     * @tc.type    FUNCTION
     * @tc.size    LARGETEST
     * @tc.level   LEVEL1
     */
    it('testNetManagerBaseGetConnectOwnerUid2000', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL1, async (done: Function) => {
      try {
        let uid = await connection.getConnectOwnerUid(
          connection.ProtocolType.PROTO_TYPE_TCP,
          { address: 'gggg::1', family: FAMILY_IPV6, port: 12345 },
          { address: 'gggg::1', family: FAMILY_IPV6, port: 54321 }
        );
        hilog.info(DOMAIN, TAG, '[TCP_IPv6_InvalidIpFormat] uid=%{public}d', uid);
        expect().assertFail();
        done();
      } catch (err) {
        let error = err as BusinessError;
        hilog.info(DOMAIN, TAG, '[TCP_IPv6_InvalidIpFormat] error: code=%{public}d', error.code);
        expect(Number(error.code)).assertEqual(2100001);
        done();
      }
    });

    /**
     * @tc.name    testNetManagerBaseGetConnectOwnerUid2100
     * @tc.number  SUB_NetMgrBase_GetConnect_OwnerUid_2100
     * @tc.desc    Test error code 2100001 with empty IPv6 address
     * @tc.type    FUNCTION
     * @tc.size    LARGETEST
     * @tc.level   LEVEL1
     */
    it('testNetManagerBaseGetConnectOwnerUid2100', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL1, async (done: Function) => {
      try {
        let uid = await connection.getConnectOwnerUid(
          connection.ProtocolType.PROTO_TYPE_TCP,
          { address: '', family: FAMILY_IPV6, port: 12345 },
          { address: '', family: FAMILY_IPV6, port: 54321 }
        );
        hilog.info(DOMAIN, TAG, '[TCP_IPv6_EmptyAddr] uid=%{public}d', uid);
        expect().assertFail();
        done();
      } catch (err) {
        let error = err as BusinessError;
        hilog.info(DOMAIN, TAG, '[TCP_IPv6_EmptyAddr] error: code=%{public}d', error.code);
        expect(Number(error.code)).assertEqual(2100001);
        done();
      }
    });

    /**
     * @tc.name    testNetManagerBaseGetConnectOwnerUid2500
     * @tc.number  SUB_NetMgrBase_GetConnect_OwnerUid_2500
     * @tc.desc    Test sync API error handling with invalid IPv6 address tuple
     * @tc.type    FUNCTION
     * @tc.size    LARGETEST
     * @tc.level   LEVEL1
     */
    it('testNetManagerBaseGetConnectOwnerUid2500', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL1, async (done: Function) => {
      try {
        let uid = connection.getConnectOwnerUidSync(
          connection.ProtocolType.PROTO_TYPE_TCP,
          { address: '2001:db8::ffff', family: FAMILY_IPV6, port: 99999 },
          { address: '2001:db8::1', family: FAMILY_IPV6, port: 12345 }
        );
        hilog.info(DOMAIN, TAG, '[TCP_IPv6_Sync_InvalidAddr] uid=%{public}d', uid);
        expect().assertFail();
        done();
      } catch (err) {
        let error = err as BusinessError;
        hilog.info(DOMAIN, TAG, '[TCP_IPv6_Sync_InvalidAddr] error: code=%{public}d', error.code);
        expect(Number(error.code)).assertEqual(2100001);
        done();
      }
    });

    /**
     * @tc.name    testNetManagerBaseGetConnectOwnerUid2600
     * @tc.number  SUB_NetMgrBase_GetConnect_OwnerUid_2600
     * @tc.desc    Test sync API error code 2100001 with invalid IPv6 format
     * @tc.type    FUNCTION
     * @tc.size    LARGETEST
     * @tc.level   LEVEL1
     */
    it('testNetManagerBaseGetConnectOwnerUid2600', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL1, async (done: Function) => {
      try {
        let uid = connection.getConnectOwnerUidSync(
          connection.ProtocolType.PROTO_TYPE_TCP,
          { address: 'gggg::1', family: FAMILY_IPV6, port: 12345 },
          { address: 'gggg::1', family: FAMILY_IPV6, port: 54321 }
        );
        hilog.info(DOMAIN, TAG, '[TCP_IPv6_Sync_InvalidIpFormat] uid=%{public}d', uid);
        expect().assertFail();
        done();
      } catch (err) {
        let error = err as BusinessError;
        hilog.info(DOMAIN, TAG, '[TCP_IPv6_Sync_InvalidIpFormat] error: code=%{public}d', error.code);
        expect(Number(error.code)).assertEqual(2100001);
        done();
      }
    });

    /**
     * @tc.name    testNetManagerBaseGetConnectOwnerUid2700
     * @tc.number  SUB_NetMgrBase_GetConnect_OwnerUid_2700
     * @tc.desc    Test sync API error code 2100001 with empty IPv6 address
     * @tc.type    FUNCTION
     * @tc.size    LARGETEST
     * @tc.level   LEVEL1
     */
    it('testNetManagerBaseGetConnectOwnerUid2700', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL1, async (done: Function) => {
      try {
        let uid = connection.getConnectOwnerUidSync(
          connection.ProtocolType.PROTO_TYPE_TCP,
          { address: '', family: FAMILY_IPV6, port: 12345 },
          { address: '', family: FAMILY_IPV6, port: 54321 }
        );
        hilog.info(DOMAIN, TAG, '[TCP_IPv6_Sync_EmptyAddr] uid=%{public}d', uid);
        expect().assertFail();
        done();
      } catch (err) {
        let error = err as BusinessError;
        hilog.info(DOMAIN, TAG, '[TCP_IPv6_Sync_EmptyAddr] error: code=%{public}d', error.code);
        expect(Number(error.code)).assertEqual(2100001);
        done();
      }
    });

    // ==================== UDP IPv4 test cases ====================
    /**
     * @tc.name    testNetManagerBaseGetConnectOwnerUid3200
     * @tc.number  SUB_NetMgrBase_GetConnect_OwnerUid_3200
     * @tc.desc    Test error code 2100001 with invalid IP format for UDP IPv4
     * @tc.type    FUNCTION
     * @tc.size    LARGETEST
     * @tc.level   LEVEL1
     */
    it('testNetManagerBaseGetConnectOwnerUid3200', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL1, async (done: Function) => {
      try {
        let uid = await connection.getConnectOwnerUid(
          connection.ProtocolType.PROTO_TYPE_UDP,
          { address: '999.999.999.999', family: FAMILY_IPV4, port: 12345 },
          { address: '999.999.999.999', family: FAMILY_IPV4, port: 54321 }
        );
        hilog.info(DOMAIN, TAG, '[UDP_IPv4_InvalidIpFormat] uid=%{public}d', uid);
        expect().assertFail();
        done();
      } catch (err) {
        let error = err as BusinessError;
        hilog.info(DOMAIN, TAG, '[UDP_IPv4_InvalidIpFormat] error: code=%{public}d', error.code);
        expect(Number(error.code)).assertEqual(2100001);
        done();
      }
    });

    /**
     * @tc.name    testNetManagerBaseGetConnectOwnerUid3300
     * @tc.number  SUB_NetMgrBase_GetConnect_OwnerUid_3300
     * @tc.desc    Test error handling with invalid UDP IPv4 address tuple
     * @tc.type    FUNCTION
     * @tc.size    LARGETEST
     * @tc.level   LEVEL1
     */
    it('testNetManagerBaseGetConnectOwnerUid3300', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL1, async (done: Function) => {
      try {
        let uid = await connection.getConnectOwnerUid(
          connection.ProtocolType.PROTO_TYPE_UDP,
          { address: '192.168.255.255', family: FAMILY_IPV4, port: 99999 },
          { address: '10.255.255.255', family: FAMILY_IPV4, port: 12345 }
        );
        hilog.info(DOMAIN, TAG, '[UDP_IPv4_InvalidAddr] uid=%{public}d', uid);
        expect().assertFail();
        done();
      } catch (err) {
        let error = err as BusinessError;
        hilog.info(DOMAIN, TAG, '[UDP_IPv4_InvalidAddr] error: code=%{public}d', error.code);
        expect(Number(error.code)).assertEqual(2100001);
        done();
      }
    });

    /**
     * @tc.name    testNetManagerBaseGetConnectOwnerUid3400
     * @tc.number  SUB_NetMgrBase_GetConnect_OwnerUid_3400
     * @tc.desc    Test error code 2100001 with empty UDP IPv4 address
     * @tc.type    FUNCTION
     * @tc.size    LARGETEST
     * @tc.level   LEVEL1
     */
    it('testNetManagerBaseGetConnectOwnerUid3400', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL1, async (done: Function) => {
      try {
        let uid = await connection.getConnectOwnerUid(
          connection.ProtocolType.PROTO_TYPE_UDP,
          { address: '', family: FAMILY_IPV4, port: 12345 },
          { address: '', family: FAMILY_IPV4, port: 54321 }
        );
        hilog.info(DOMAIN, TAG, '[UDP_IPv4_EmptyAddr] uid=%{public}d', uid);
        expect().assertFail();
        done();
      } catch (err) {
        let error = err as BusinessError;
        hilog.info(DOMAIN, TAG, '[UDP_IPv4_EmptyAddr] error: code=%{public}d', error.code);
        expect(Number(error.code)).assertEqual(2100001);
        done();
      }
    });

    /**
     * @tc.name    testNetManagerBaseGetConnectOwnerUid3401
     * @tc.number  SUB_NetMgrBase_GetConnect_OwnerUid_3401
     * @tc.desc    Test error code 2100001 with invalid port -1
     * @tc.type    FUNCTION
     * @tc.size    LARGETEST
     * @tc.level   LEVEL1
     */
    it('testNetManagerBaseGetConnectOwnerUid3401', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL1, async (done: Function) => {
      try {
        let uid = await connection.getConnectOwnerUid(
          connection.ProtocolType.PROTO_TYPE_UDP,
          { address: '192.168.1.100', family: FAMILY_IPV4, port: -1 },
          { address: '192.168.1.200', family: FAMILY_IPV4, port: -1 }
        );
        hilog.info(DOMAIN, TAG, '[UDP_IPv4_Invalid_Port] uid=%{public}d', uid);
        expect().assertFail();
        done();
      } catch (err) {
        let error = err as BusinessError;
        hilog.info(DOMAIN, TAG, '[UDP_IPv4_Invalid_Port] error: code=%{public}d', error.code);
        expect(Number(error.code)).assertEqual(2100001);
        done();
      }
    });

    /**
     * @tc.name    testNetManagerBaseGetConnectOwnerUid3402
     * @tc.number  SUB_NetMgrBase_GetConnect_OwnerUid_3402
     * @tc.desc    Test error code 2100001 with invalid port 65536
     * @tc.type    FUNCTION
     * @tc.size    LARGETEST
     * @tc.level   LEVEL1
     */
    it('testNetManagerBaseGetConnectOwnerUid3402', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL1, async (done: Function) => {
      try {
        let uid = await connection.getConnectOwnerUid(
          connection.ProtocolType.PROTO_TYPE_UDP,
          { address: '127.0.0.1', family: FAMILY_IPV4, port: 65536 },
          { address: '127.0.0.1', family: FAMILY_IPV4, port: 65536 }
        );
        hilog.info(DOMAIN, TAG, '[UDP_IPv4_InvalidPort] uid=%{public}d', uid);
        expect().assertFail();
        done();
      } catch (err) {
        let error = err as BusinessError;
        hilog.info(DOMAIN, TAG, '[UDP_IPv4_InvalidPort] error: code=%{public}d', error.code);
        expect(Number(error.code)).assertEqual(2100001);
        done();
      }
    });

    /**
     * @tc.name    testNetManagerBaseGetConnectOwnerUid3800
     * @tc.number  SUB_NetMgrBase_GetConnect_OwnerUid_3800
     * @tc.desc    Test sync API error code 2100001 with invalid IP format for UDP IPv4
     * @tc.type    FUNCTION
     * @tc.size    LARGETEST
     * @tc.level   LEVEL1
     */
    it('testNetManagerBaseGetConnectOwnerUid3800', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL1, async (done: Function) => {
      try {
        let uid = connection.getConnectOwnerUidSync(
          connection.ProtocolType.PROTO_TYPE_UDP,
          { address: '999.999.999.999', family: FAMILY_IPV4, port: 12345 },
          { address: '999.999.999.999', family: FAMILY_IPV4, port: 54321 }
        );
        hilog.info(DOMAIN, TAG, '[UDP_IPv4_Sync_InvalidIpFormat] uid=%{public}d', uid);
        expect().assertFail();
        done();
      } catch (err) {
        let error = err as BusinessError;
        hilog.info(DOMAIN, TAG, '[UDP_IPv4_Sync_InvalidIpFormat] error: code=%{public}d', error.code);
        expect(Number(error.code)).assertEqual(2100001);
        done();
      }
    });

    /**
     * @tc.name    testNetManagerBaseGetConnectOwnerUid3900
     * @tc.number  SUB_NetMgrBase_GetConnect_OwnerUid_3900
     * @tc.desc    Test sync API error handling with invalid UDP IPv4 address tuple
     * @tc.type    FUNCTION
     * @tc.size    LARGETEST
     * @tc.level   LEVEL1
     */
    it('testNetManagerBaseGetConnectOwnerUid3900', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL1, async (done: Function) => {
      try {
        let uid = connection.getConnectOwnerUidSync(
          connection.ProtocolType.PROTO_TYPE_UDP,
          { address: '192.168.255.255', family: FAMILY_IPV4, port: 99999 },
          { address: '10.255.255.255', family: FAMILY_IPV4, port: 12345 }
        );
        hilog.info(DOMAIN, TAG, '[UDP_IPv4_Sync_InvalidAddr] uid=%{public}d', uid);
        expect().assertFail();
        done();
      } catch (err) {
        let error = err as BusinessError;
        hilog.info(DOMAIN, TAG, '[UDP_IPv4_Sync_InvalidAddr] error: code=%{public}d', error.code);
        expect(Number(error.code)).assertEqual(2100001);
        done();
      }
    });

    /**
     * @tc.name    testNetManagerBaseGetConnectOwnerUid4000
     * @tc.number  SUB_NetMgrBase_GetConnect_OwnerUid_4000
     * @tc.desc    Test sync API error code 2100001 with empty UDP IPv4 address
     * @tc.type    FUNCTION
     * @tc.size    LARGETEST
     * @tc.level   LEVEL1
     */
    it('testNetManagerBaseGetConnectOwnerUid4000', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL1, async (done: Function) => {
      try {
        let uid = connection.getConnectOwnerUidSync(
          connection.ProtocolType.PROTO_TYPE_UDP,
          { address: '', family: FAMILY_IPV4, port: 12345 },
          { address: '', family: FAMILY_IPV4, port: 54321 }
        );
        hilog.info(DOMAIN, TAG, '[UDP_IPv4_Sync_EmptyAddr] uid=%{public}d', uid);
        expect().assertFail();
        done();
      } catch (err) {
        let error = err as BusinessError;
        hilog.info(DOMAIN, TAG, '[UDP_IPv4_Sync_EmptyAddr] error: code=%{public}d', error.code);
        expect(Number(error.code)).assertEqual(2100001);
        done();
      }
    });

    /**
     * @tc.name    testNetManagerBaseGetConnectOwnerUid4001
     * @tc.number  SUB_NetMgrBase_GetConnect_OwnerUid_4001
     * @tc.desc    Test error code 2100001 with invalid port -1
     * @tc.type    FUNCTION
     * @tc.size    LARGETEST
     * @tc.level   LEVEL1
     */
    it('testNetManagerBaseGetConnectOwnerUid4001', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL1, async (done: Function) => {
      try {
        let uid = connection.getConnectOwnerUidSync(
          connection.ProtocolType.PROTO_TYPE_UDP,
          { address: '192.168.1.100', family: FAMILY_IPV4, port: -1 },
          { address: '192.168.1.200', family: FAMILY_IPV4, port: -1 }
        );
        hilog.info(DOMAIN, TAG, '[UDP_IPv4_Invalid_Port] uid=%{public}d', uid);
        expect().assertFail();
        done();
      } catch (err) {
        let error = err as BusinessError;
        hilog.info(DOMAIN, TAG, '[UDP_IPv4_Invalid_Port] error: code=%{public}d', error.code);
        expect(Number(error.code)).assertEqual(2100001);
        done();
      }
    });

    /**
     * @tc.name    testNetManagerBaseGetConnectOwnerUid4002
     * @tc.number  SUB_NetMgrBase_GetConnect_OwnerUid_4002
     * @tc.desc    Test error code 2100001 with invalid port 65536
     * @tc.type    FUNCTION
     * @tc.size    LARGETEST
     * @tc.level   LEVEL1
     */
    it('testNetManagerBaseGetConnectOwnerUid4002', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL1, async (done: Function) => {
      try {
        let uid = connection.getConnectOwnerUidSync(
          connection.ProtocolType.PROTO_TYPE_UDP,
          { address: '127.0.0.1', family: FAMILY_IPV4, port: 65536 },
          { address: '127.0.0.1', family: FAMILY_IPV4, port: 65536 }
        );
        hilog.info(DOMAIN, TAG, '[UDP_IPv4_InvalidPort] uid=%{public}d', uid);
        expect().assertFail();
        done();
      } catch (err) {
        let error = err as BusinessError;
        hilog.info(DOMAIN, TAG, '[UDP_IPv4_InvalidPort] error: code=%{public}d', error.code);
        expect(Number(error.code)).assertEqual(2100001);
        done();
      }
    });

    // ==================== UDP IPv6 test cases ====================
    /**
     * @tc.name    testNetManagerBaseGetConnectOwnerUid4500
     * @tc.number  SUB_NetMgrBase_GetConnect_OwnerUid_4500
     * @tc.desc    Test error handling with invalid UDP IPv6 address tuple
     * @tc.type    FUNCTION
     * @tc.size    LARGETEST
     * @tc.level   LEVEL1
     */
    it('testNetManagerBaseGetConnectOwnerUid4500', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL1, async (done: Function) => {
      try {
        let uid = await connection.getConnectOwnerUid(
          connection.ProtocolType.PROTO_TYPE_UDP,
          { address: '2001:db8::ffff', family: FAMILY_IPV6, port: 99999 },
          { address: '2001:db8::1', family: FAMILY_IPV6, port: 12345 }
        );
        hilog.info(DOMAIN, TAG, '[UDP_IPv6_InvalidAddr] uid=%{public}d', uid);
        expect().assertFail();
        done();
      } catch (err) {
        let error = err as BusinessError;
        hilog.info(DOMAIN, TAG, '[UDP_IPv6_InvalidAddr] error: code=%{public}d', error.code);
        expect(Number(error.code)).assertEqual(2100001);
        done();
      }
    });

    /**
     * @tc.name    testNetManagerBaseGetConnectOwnerUid4600
     * @tc.number  SUB_NetMgrBase_GetConnect_OwnerUid_4600
     * @tc.desc    Test error code 2100001 with invalid IPv6 format for UDP
     * @tc.type    FUNCTION
     * @tc.size    LARGETEST
     * @tc.level   LEVEL1
     */
    it('testNetManagerBaseGetConnectOwnerUid4600', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL1, async (done: Function) => {
      try {
        let uid = await connection.getConnectOwnerUid(
          connection.ProtocolType.PROTO_TYPE_UDP,
          { address: 'gggg::1', family: FAMILY_IPV6, port: 12345 },
          { address: 'gggg::1', family: FAMILY_IPV6, port: 54321 }
        );
        hilog.info(DOMAIN, TAG, '[UDP_IPv6_InvalidIpFormat] uid=%{public}d', uid);
        expect().assertFail();
        done();
      } catch (err) {
        let error = err as BusinessError;
        hilog.info(DOMAIN, TAG, '[UDP_IPv6_InvalidIpFormat] error: code=%{public}d', error.code);
        expect(Number(error.code)).assertEqual(2100001);
        done();
      }
    });

    /**
     * @tc.name    testNetManagerBaseGetConnectOwnerUid4700
     * @tc.number  SUB_NetMgrBase_GetConnect_OwnerUid_4700
     * @tc.desc    Test error code 2100001 with empty UDP IPv6 address
     * @tc.type    FUNCTION
     * @tc.size    LARGETEST
     * @tc.level   LEVEL1
     */
    it('testNetManagerBaseGetConnectOwnerUid4700', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL1, async (done: Function) => {
      try {
        let uid = await connection.getConnectOwnerUid(
          connection.ProtocolType.PROTO_TYPE_UDP,
          { address: '', family: FAMILY_IPV6, port: 12345 },
          { address: '', family: FAMILY_IPV6, port: 54321 }
        );
        hilog.info(DOMAIN, TAG, '[UDP_IPv6_EmptyAddr] uid=%{public}d', uid);
        expect().assertFail();
        done();
      } catch (err) {
        let error = err as BusinessError;
        hilog.info(DOMAIN, TAG, '[UDP_IPv6_EmptyAddr] error: code=%{public}d', error.code);
        expect(Number(error.code)).assertEqual(2100001);
        done();
      }
    });

    /**
     * @tc.name    testNetManagerBaseGetConnectOwnerUid5100
     * @tc.number  SUB_NetMgrBase_GetConnect_OwnerUid_5100
     * @tc.desc    Test sync API error handling with invalid UDP IPv6 address tuple
     * @tc.type    FUNCTION
     * @tc.size    LARGETEST
     * @tc.level   LEVEL1
     */
    it('testNetManagerBaseGetConnectOwnerUid5100', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL1, async (done: Function) => {
      try {
        let uid = connection.getConnectOwnerUidSync(
          connection.ProtocolType.PROTO_TYPE_UDP,
          { address: '2001:db8::ffff', family: FAMILY_IPV6, port: 99999 },
          { address: '2001:db8::1', family: FAMILY_IPV6, port: 12345 }
        );
        hilog.info(DOMAIN, TAG, '[UDP_IPv6_Sync_InvalidAddr] uid=%{public}d', uid);
        expect().assertFail();
        done();
      } catch (err) {
        let error = err as BusinessError;
        hilog.info(DOMAIN, TAG, '[UDP_IPv6_Sync_InvalidAddr] error: code=%{public}d', error.code);
        expect(Number(error.code)).assertEqual(2100001);
        done();
      }
    });

    /**
     * @tc.name    testNetManagerBaseGetConnectOwnerUid5200
     * @tc.number  SUB_NetMgrBase_GetConnect_OwnerUid_5200
     * @tc.desc    Test sync API error code 2100001 with invalid IPv6 format for UDP
     * @tc.type    FUNCTION
     * @tc.size    LARGETEST
     * @tc.level   LEVEL1
     */
    it('testNetManagerBaseGetConnectOwnerUid5200', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL1, async (done: Function) => {
      try {
        let uid = connection.getConnectOwnerUidSync(
          connection.ProtocolType.PROTO_TYPE_UDP,
          { address: 'gggg::1', family: FAMILY_IPV6, port: 12345 },
          { address: 'gggg::1', family: FAMILY_IPV6, port: 54321 }
        );
        hilog.info(DOMAIN, TAG, '[UDP_IPv6_Sync_InvalidIpFormat] uid=%{public}d', uid);
        expect().assertFail();
        done();
      } catch (err) {
        let error = err as BusinessError;
        hilog.info(DOMAIN, TAG, '[UDP_IPv6_Sync_InvalidIpFormat] error: code=%{public}d', error.code);
        expect(Number(error.code)).assertEqual(2100001);
        done();
      }
    });

    /**
     * @tc.name    testNetManagerBaseGetConnectOwnerUid5300
     * @tc.number  SUB_NetMgrBase_GetConnect_OwnerUid_5300
     * @tc.desc    Test sync API error code 2100001 with empty UDP IPv6 address
     * @tc.type    FUNCTION
     * @tc.size    LARGETEST
     * @tc.level   LEVEL1
     */
    it('testNetManagerBaseGetConnectOwnerUid5300', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL1, async (done: Function) => {
      try {
        let uid = connection.getConnectOwnerUidSync(
          connection.ProtocolType.PROTO_TYPE_UDP,
          { address: '', family: FAMILY_IPV6, port: 12345 },
          { address: '', family: FAMILY_IPV6, port: 54321 }
        );
        hilog.info(DOMAIN, TAG, '[UDP_IPv6_Sync_EmptyAddr] uid=%{public}d', uid);
        expect().assertFail();
        done();
      } catch (err) {
        let error = err as BusinessError;
        hilog.info(DOMAIN, TAG, '[UDP_IPv6_Sync_EmptyAddr] error: code=%{public}d', error.code);
        expect(Number(error.code)).assertEqual(2100001);
        done();
      }
    });

    /**
     * @tc.name    testNetManagerBaseGetConnectOwnerUid9000
     * @tc.number  SUB_NetMgrBase_GetConnect_OwnerUid_9000
     * @tc.desc    Test error code 2100301
     * @tc.type    FUNCTION
     * @tc.size    LARGETEST
     * @tc.level   LEVEL1
     */
    it('testNetManagerBaseGetConnectOwnerUid9000', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL1, async (done: Function) => {
      let caseName = "testNetManagerBaseGetConnectOwnerUid9000";
      console.info(`${caseName}---Start`);
      try {
        let uid = await connection.getConnectOwnerUid(
          connection.ProtocolType.PROTO_TYPE_TCP,
          { address: '192.168.1.100', family: FAMILY_IPV4, port: 12345 },
          { address: '192.168.1.200', family: FAMILY_IPV4, port: 54321 }
        );
        console.info(`${caseName} [TCP_IPv4_IncorrectUsage] ${uid}`);
        expect().assertFail();
        console.info(`${caseName}---End`);
        done();
      } catch (err) {
        let error = err as BusinessError;
        console.info(`${caseName} [TCP_IPv4_IncorrectUsage] error: code=${error.code}`);
        expect(Number(error.code)).assertEqual(2100301);
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.name    testNetManagerBaseGetConnectOwnerUid9100
     * @tc.number  SUB_NetMgrBase_GetConnect_OwnerUid_9100
     * @tc.desc    Test error code 2100301
     * @tc.type    FUNCTION
     * @tc.size    LARGETEST
     * @tc.level   LEVEL1
     */
    it('testNetManagerBaseGetConnectOwnerUid9100', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL1, async (done: Function) => {
      let caseName = "testNetManagerBaseGetConnectOwnerUid9100";
      console.info(`${caseName}---Start`);
      try {
        let uid = connection.getConnectOwnerUidSync(
          connection.ProtocolType.PROTO_TYPE_TCP,
          { address: '192.168.1.100', family: FAMILY_IPV4, port: 12345 },
          { address: '192.168.1.200', family: FAMILY_IPV4, port: 54321 }
        );
        console.info(`${caseName} [TCP_IPv4_Sync_IncorrectUsage] uid=${uid}`);
        expect().assertFail();
        console.info(`${caseName}---End`);
        done();
      } catch (err) {
        let error = err as BusinessError;
        console.info(`${caseName} [TCP_IPv4_Sync_IncorrectUsage] error: code=${error.code}`);
        expect(Number(error.code)).assertEqual(2100301);
        console.info(`${caseName}---End`);
        done();
      }
    });
  });
}
