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

import { describe, it, expect, Level, Size, TestType } from '@ohos/hypium';
import socket from '@ohos.net.socket';
import { BusinessError, Callback } from '@ohos.base';

let server_key: string = "-----BEGIN PRIVATE KEY-----\n" +
"MIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQDc5nwJoLVtmQGB\n" +
"fE49oEjDQvSKTht5oXcn4CzsMekvpQxe3B0isb9gXaUZyF37MQtjzyi5swNa0FQR\n" +
"17OYhl8dElJa8kEM3tIy7sTNhskh8LIHBjscfbZ1ype1Y+lPLkdVR+mx6rcOIp/q\n" +
"0m+ny1NcIN1Vs+GeXBdLb9O2m0IxYaa6799esFJ/M5K8num75idZBezfhhyUt469\n" +
"ooLT8JkLnnV/ps3O6yoy+9kF8qI3GIJ13wN3jfyRQBU+y66BQ90Wx/aLaLtzBnoX\n" +
"lO/gVSa6pgvQsle5w5AM1JgQpeN7E7KMudMteBEbyAdu4j1AB59mDhKmDqD4+i7f\n" +
"GIJbIcP7AgMBAAECggEAF3utHfzmrKMCZPiI/MYoVhGtG3LYOuLuXt/XBrj7mCQM\n" +
"n5z4v/JzbNQntAj37Lc3BcJFCxC7v5C8DzWGEyXdwKJs/NwaDDs3z1BQvaShhykm\n" +
"U9bWu92lYvpJjG/1ooRB8w/1CQPxt9/4bic21XipAPdBcFXyGzqhA1T9BcGVlNgh\n" +
"IBSaoS9xMMnd0Yf8dYu31aTQ3vUXqYxQ2+flwRyeg8rxJpWgtbcAcI2BHq+/C4Ga\n" +
"BbB1rQwp32ehm7z8beIwJJ3R2REnuhrly6/cpzn+2PfC8aR47XgflrZhv4yLXSOZ\n" +
"wQli6MnLPTjMbOFbKUyQM8Vsru4n1sdMLYjRF4tiCQKBgQD2tuZu/+tONiNGwGAu\n" +
"iLGELriIM8YmeQ4u+KH7dbtFRushvCMaEexDu+jMscSWUYUJp5iG8xQdhsoZtPkF\n" +
"5+rBZ4tnOg8CslUbryBVjIN7Vw8yF/X+NE+r38/L2Aaz2mW0zJ/sWff1u58haweU\n" +
"olTetLvoUI0Yn1i3TwhJb740JQKBgQDlNt1bI7filQNEU+zKgMReVEcN42taNrTc\n" +
"Ny05By7pHsgXCs6mf2KxbBb96vwez52heK3ov6QOmrOtJgCoIEnbrrk3pjGapja4\n" +
"AbriA1MLcN5ScyBGMh0r+x7emJaN46qdWINJjXnb/ZKNZhSj43yJMilTSo/fG06J\n" +
"NNObffuNnwKBgQCRcwDlXdFu2bHwa0gJByOIpza5bbSbR/EZthFhO2Z9kDLdP5p+\n" +
"KyTcRfMYgpFAgazqJTliDfrE8YtCnpPVbIXVIeNopyzkTRip6pQoe1+kno3h3Yh0\n" +
"Joj17kwGhERnUhF2BtEduWjbIZLOU9gzQ4S/i1PgwWR9qKvX3isniE5dVQKBgDXC\n" +
"f3pfz0IyZvjAoloAh44EQEIOo+Ad0p+PxWiJucPtd0qIO12rpO8uBdp6IbXsRfFY\n" +
"R5m+UPEn8Zpbvm2wXQJMYZ6euSWndFAF/9oAo5qcV1iJLfmoyVTGakAVE8Klsh+D\n" +
"Yg9/QiSJvbSyS4cA1PWssSqa41GVqv7dSABBNR3LAoGBAJe7TBw4rWM2Vz7ejVxO\n" +
"7q5NpMptivyJ6DqoHKFVLOJWXAtaUqfidO8CyFdCSDWoiTqyUvhxQOAHDtVAHjuZ\n" +
"ORpYnZRa5ONbWYTR0vSf93YyckeG6EQZQa3qAMWoiru/VvSx1ozPs3Grh3jjFKGs\n" +
"u/iAg5IeR+C9Fv0BFgaJ26bw\n" +
"-----END PRIVATE KEY-----\n"

let server_ca: string =
"-----BEGIN CERTIFICATE-----\n" +
"MIIDbTCCAlWgAwIBAgIUC5RSSzOctHDYW0cYIhmBh7oQxVgwDQYJKoZIhvcNAQEL\n" +
"BQAwRTELMAkGA1UEBhMCQVUxEzARBgNVBAgMClNvbWUtU3RhdGUxITAfBgNVBAoM\n" +
"GEludGVybmV0IFdpZGdpdHMgUHR5IEx0ZDAgFw0yNTA2MTAxMTMzMjBaGA8yMDU1\n" +
"MDYwMzExMzMyMFowRTELMAkGA1UEBhMCQVUxEzARBgNVBAgMClNvbWUtU3RhdGUx\n" +
"ITAfBgNVBAoMGEludGVybmV0IFdpZGdpdHMgUHR5IEx0ZDCCASIwDQYJKoZIhvcN\n" +
"AQEBBQADggEPADCCAQoCggEBANzmfAmgtW2ZAYF8Tj2gSMNC9IpOG3mhdyfgLOwx\n" +
"6S+lDF7cHSKxv2BdpRnIXfsxC2PPKLmzA1rQVBHXs5iGXx0SUlryQQze0jLuxM2G\n" +
"ySHwsgcGOxx9tnXKl7Vj6U8uR1VH6bHqtw4in+rSb6fLU1wg3VWz4Z5cF0tv07ab\n" +
"QjFhprrv316wUn8zkrye6bvmJ1kF7N+GHJS3jr2igtPwmQuedX+mzc7rKjL72QXy\n" +
"ojcYgnXfA3eN/JFAFT7LroFD3RbH9otou3MGeheU7+BVJrqmC9CyV7nDkAzUmBCl\n" +
"43sTsoy50y14ERvIB27iPUAHn2YOEqYOoPj6Lt8Yglshw/sCAwEAAaNTMFEwHQYD\n" +
"VR0OBBYEFIrPKtMjljbgX/fp+CV47cFjeLYBMB8GA1UdIwQYMBaAFIrPKtMjljbg\n" +
"X/fp+CV47cFjeLYBMA8GA1UdEwEB/wQFMAMBAf8wDQYJKoZIhvcNAQELBQADggEB\n" +
"AI0F84on5dOGIhRjIsBiJyuYf1Ob49GopGswVOTye2j74BKiVsGmXNeyXKHuBsq8\n" +
"IOepV3TS9siGCErRaL10tJywi+JbBbtMKkTVAH8IwCPFS3KYR9ZFD0qZTmf5O+Gv\n" +
"UTWl43WN9g0E3bEIMl8WBsbg5Zhl/+BJztBSgaQEqnyKeb8lfCXuZCmHBtNeN83c\n" +
"YUaDE4SDi3f+KZm+FyiPhx+X8U5yzEwleN0OOP0GmaHKpUqnRPNos1wqonS3Zh+8\n" +
"K4cloMMEG6S+cWIyk4dFG6Emji/5qf2FlvSDIUju+zCWCX1trvneL55v4mKBgD16\n" +
"g1uuJ6kpRiG0CEonEBXB0/0=\n" +
"-----END CERTIFICATE-----\n"

let client_ca: string =
"-----BEGIN CERTIFICATE-----\n" +
"MIIDbTCCAlWgAwIBAgIUASHS9V7Uu9oyqmwoPTqvmUFsdUowDQYJKoZIhvcNAQEL\n" +
"BQAwRTELMAkGA1UEBhMCQVUxEzARBgNVBAgMClNvbWUtU3RhdGUxITAfBgNVBAoM\n" +
"GEludGVybmV0IFdpZGdpdHMgUHR5IEx0ZDAgFw0yNTA2MTAxMTIxMjhaGA8yMDU1\n" +
"MDYwMzExMjEyOFowRTELMAkGA1UEBhMCQVUxEzARBgNVBAgMClNvbWUtU3RhdGUx\n" +
"ITAfBgNVBAoMGEludGVybmV0IFdpZGdpdHMgUHR5IEx0ZDCCASIwDQYJKoZIhvcN\n" +
"AQEBBQADggEPADCCAQoCggEBAM5AAwvpyrpHOLm+TBZBOxfown4gs1XNMMbzBuxs\n" +
"H2zWn40xgS0amWz+s9fgSpFlBOrfN/qmpPWnNlyAj9zRgNp29p7FJbjqWIrEeiCI\n" +
"9TrM1fY0TLmr3J/Tdb/ZZxoERF8lh1hw+X02DVB4dEqg7amrQbl4gLShVM7bLOSw\n" +
"vpbICFkbOMax2Gv9N7eARH7eLVoTjZ0ckB3hNEB1BobWdjWc1SLiu0R+Xnjlv1+m\n" +
"EpV5igI4v/oDkiEEpQN5h0H9YHxvsB0PU/TYJ727HkiMyLuBW+p+jXiJS6ydCeHc\n" +
"H09H5GiA9oqa3RX0bTYCnPYohgkLEdsFgKIXxiNL2+PjYscCAwEAAaNTMFEwHQYD\n" +
"VR0OBBYEFG8rsAxolBK0DNP5I8SKVpz0qm2mMB8GA1UdIwQYMBaAFG8rsAxolBK0\n" +
"DNP5I8SKVpz0qm2mMA8GA1UdEwEB/wQFMAMBAf8wDQYJKoZIhvcNAQELBQADggEB\n" +
"AH+GiRfwKFjezpMDZHYPw2iIoQxHa00mpQ81MwlPfnJvqG5fIwqXcKigl7iPrthB\n" +
"pIvFRMzgzsYQmZwmEVgnVqaq1f8R8WqhjbiS+QpBV+QKipFQg6GwGGBKrsDllSYW\n" +
"jYdXAyAwevrJeeMl/kkbICLkGn5RLzaCkMXEIfCjs1CMMUHn0Mren9HfntWzAoSo\n" +
"su2ZmrZloUAw4PwagtJfM1L0uUCvMlbNLVR4Ol8i/KzpXThD7how4gFIXQ93QZ+k\n" +
"j3r+apVFPlgp03IVxF0Pm/NM2q1T7Kl8yvVb92nFfI7/+yynctG4Wl3R6NHZjMn8\n" +
"wVxxyIC/keppOl2C4Lu0XFs=\n" +
"-----END CERTIFICATE-----\n"

let client_key: string =
"-----BEGIN PRIVATE KEY-----\n" +
"MIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQDOQAML6cq6Rzi5\n" +
"vkwWQTsX6MJ+ILNVzTDG8wbsbB9s1p+NMYEtGpls/rPX4EqRZQTq3zf6pqT1pzZc\n" +
"gI/c0YDadvaexSW46liKxHogiPU6zNX2NEy5q9yf03W/2WcaBERfJYdYcPl9Ng1Q\n" +
"eHRKoO2pq0G5eIC0oVTO2yzksL6WyAhZGzjGsdhr/Te3gER+3i1aE42dHJAd4TRA\n" +
"dQaG1nY1nNUi4rtEfl545b9fphKVeYoCOL/6A5IhBKUDeYdB/WB8b7AdD1P02Ce9\n" +
"ux5IjMi7gVvqfo14iUusnQnh3B9PR+RogPaKmt0V9G02Apz2KIYJCxHbBYCiF8Yj\n" +
"S9vj42LHAgMBAAECggEACfqbdEU/g3vCG2zTV1BPgMXIgzwC8UM81OyHiKewSPoX\n" +
"GG0tURsPyUtionfQNhU9uoZKTDgFAg2xEMeJ5TkySjsT1wdIlapg+uOH2bn9g3bL\n" +
"YRWTR50L86RAG1sGkpQ+2FTMgVODtY4Ig3OizMT9qHPjni9dz1+BMBWJg6leGHDZ\n" +
"Pt+ZKXY1AEhHAuy1oOye7MBgWZ7cIkhmutNFIi2SmOoYjUfLqSHz7asuHFqBCnJH\n" +
"ykuyQc706rbYfZrAkHRvjRgLft4xI8xz+aypIhufDZHsr8hujujQ+rBZDWMuknTz\n" +
"THtD6YYbmdI33ikMv78hk21jiNl8vhd1g/KJWaqS4QKBgQDmBsUcsU2gdi2v04oR\n" +
"m9LmyNeFW0HAvIAQMCCV/ISOctPjGLqfA2Wk5qg4s5rq2XLPf7pK+g7h8aLyYJyy\n" +
"lRSLle4C4fd4whEeEJVsPDYda0/Ip4tsLKWTAPzaNrRsN0VRtzHgQXInfvMAXtQg\n" +
"icLZuntPuA0aym8SP5I0V4ms+wKBgQDlifPXKldhAN86N+cdQZ9hH0rv4B0OTspK\n" +
"sdLOH1irrXYECUxXmbqeA28XnjMiKvEwD1Z1wUDd6GZgHIi8tBJl9kVgpKakRqvW\n" +
"M/41Wp0pQaDmZXXTDzoj4XMiPePK/13epxc7i3nE3bightVlbijyFhWV/WFo4AoI\n" +
"LdAcBXWfpQKBgBQKlvXvBMJsSYK+PZNXLkLpUM3Pq6TtR4MhjlVDERGQM6Hfr7LX\n" +
"Cu4ZIqL+EwtPMs+dY0/RBabt9LKFdGGi141p3LjnkzY0QmWKMFqjzFs31FW5M06T\n" +
"fUGXnnAsv/+FuUZrXa8aRKXoS6fGm1jSZ+Wsd730XT/uT0sZutVQozAtAoGBAIfN\n" +
"pJyqimPz1h5lsLEYgClAEF/3YnlymDC1IJme5iE8UVR2A9rYMxcFxRZeHLacXXIn\n" +
"wOmOWshvlRJMD4JFr5TvrYBOKeGLhmMHA+GhKNad44osgRdMLQPJgQrDPyB9EZaH\n" +
"mTE7heG5pGAlJeAK2uLPuhmxfY5E7uqD4FqTyFGZAoGBALgdQ6/VoGDqAEGEVLvg\n" +
"8/wfUo2yYFKrwlar/zyFfb9hMb+NWQ4PwyxRcpbhIkRZlrbqN2fuereZqsiXvjBX\n" +
"2BhxFrHBKw3z2KRoh4nfh3Pq7AhmiI9uvoB77yw0ehFOS2SFug2Clf0H9RaY4isd\n" +
"sAzqLzYptVuiCr4z4FSlFdrk\n" +
"-----END PRIVATE KEY-----\n"

let sendLongMessage: string =
  '创建要上传或下载的任务，并将其排入队列，每个应用最多支持创建10个未完成的任务。使用callback异步回调。' +
    '创建要上传或下载的任务，并将其排入队列，每个应用最多支持创建10个未完成的任务。使用callback异步回调。' +
    '创建要上传或下载的任务，并将其排入队列，每个应用最多支持创建10个未完成的任务。使用callback异步回调。' +
    '创建要上传或下载的任务，并将其排入队列，每个应用最多支持创建10个未完成的任务。使用callback异步回调。' +
    '创建要上传或下载的任务，并将其排入队列，每个应用最多支持创建10个未完成的任务。使用callback异步回调。' +
    '创建要上传或下载的任务，并将其排入队列，每个应用最多支持创建10个未完成的任务。使用callback异步回调。' +
    '创建要上传或下载的任务，并将其排入队列，每个应用最多支持创建10个未完成的任务。使用callback异步回调。' +
    '创建要上传或下载的任务，并将其排入队列，每个应用最多支持创建10个未完成的任务。使用callback异步回调。' +
    '创建要上传或下载的任务，并将其排入队列，每个应用最多支持创建10个未完成的任务。使用callback异步回调。' +
    '创建要上传或下载的任务，并将其排入队列，每个应用最多支持创建10个未完成的任务。使用callback异步回调。' +
    '创建要上传或下载的任务，并将其排入队列，每个应用最多支持创建10个未完成的任务。使用callback异步回调。' +
    '创建要上传或下载的任务，并将其排入队列，每个应用最多支持创建10个未完成的任务。使用callback异步回调。' +
    '创建要上传或下载的任务，并将其排入队列，每个应用最多支持创建10个未完成的任务。使用callback异步回调。' +
    '创建要上传或下载的任务，并将其排入队列，每个应用最多支持创建10个未完成的任务。使用callback异步回调。' +
    '创建要上传或下载的任务，并将其排入队列，每个应用最多支持创建10个未完成的任务。使用callback异步回调。' +
    '创建要上传或下载的任务，并将其排入队列，每个应用最多支持创建10个未完成的任务。使用callback异步回调。' +
    '创建要上传或下载的任务，并将其排入队列，每个应用最多支持创建10个未完成的任务。使用callback异步回调。' +
    '创建要上传或下载的任务，并将其排入队列，每个应用最多支持创建10个未完成的任务。使用callback异步回调。' +
    '创建要上传或下载的任务，并将其排入队列，每个应用最多支持创建10个未完成的任务。使用callback异步回调。' +
    '创建要上传或下载的任务，并将其排入队列，每个应用最多支持创建10个未完成的任务。使用callback异步回调。' +
    '创建要上传或下载的任务，并将其排入队列，每个应用最多支持创建10个未完成的任务。使用callback异步回调。' +
    '创建要上传或下载的任务，并将其排入队列，每个应用最多支持创建10个未完成的任务。使用callback异步回调。' +
    '创建要上传或下载的任务，并将其排入队列，每个应用最多支持创建10个未完成的任务。使用callback异步回调。' +
    '创建要上传或下载的任务，并将其排入队列，每个应用最多支持创建10个未完成的任务。使用callback异步回调。' +
    '创建要上传或下载的任务，并将其排入队列，每个应用最多支持创建10个未完成的任务。使用callback异步回调。' +
    '创建要上传或下载的任务，并将其排入队列，每个应用最多支持创建10个未完成的任务。使用callback异步回调。' +
    '创建要上传或下载的任务，并将其排入队列，每个应用最多支持创建10个未完成的任务。使用callback异步回调。' +
    '创建要上传或下载的任务，并将其排入队列，每个应用最多支持创建10个未完成的任务。使用callback异步回调。' +
    '创建要上传或下载的任务，并将其排入队列，每个应用最多支持创建10个未完成的任务。使用callback异步回调。' +
    '创建要上传或下载的任务，并将其排入队列，每个应用最多支持创建10个未完成的任务。使用callback异步回调。' +
    '创建要上传或下载的任务，并将其排入队列，每个应用最多支持创建10个未完成的任务。使用callback异步回调。' +
    '创建要上传或下载的任务，并将其排入队列，每个应用最多支持创建10个未完成的任务。使用callback异步回调。' +
    '创建要上传或下载的任务，并将其排入队列，每个应用最多支持创建10个未完成的任务。使用callback异步回调。' +
    '创建要上传或下载的任务，并将其排入队列，每个应用最多支持创建10个未完成的任务。使用callback异步回调。' +
    '创建要上传或下载的任务，并将其排入队列，每个应用最多支持创建10个未完成的任务。使用callback异步回调。' +
    '创建要上传或下载的任务，并将其排入队列，每个应用最多支持创建10个未完成的任务。使用callback异步回调。' +
    '创建要上传或下载的任务，并将其排入队列，每个应用最多支持创建10个未完成的任务。使用callback异步回调。' +
    '创建要上传或下载的任务，并将其排入队列，每个应用最多支持创建10个未完成的任务。使用callback异步回调。' +
    '创建要上传或下载的任务，并将其排入队列，每个应用最多支持创建10个未完成的任务。使用callback异步回调。'
let tlsServer: socket.TLSSocketServer = socket.constructTLSSocketServerInstance();
let tlsClient: socket.TLSSocket = socket.constructTLSSocketInstance();

let addr: socket.NetAddress = {
  address: '127.0.0.1',
  port: 8001,
  family: 1
};

let ServerOptions: socket.TLSConnectOptions = {
  address: addr,
  secureOptions: {
    ca: client_ca,
    key: server_key,
    password: '123456',
    cert: server_ca,
    protocols: [socket.Protocol.TLSv12],
    useRemoteCipherPrefer: true,
    signatureAlgorithms: "rsa_pss_rsae_sha256:ECDSA+SHA256",
    cipherSuite: "AES256-SHA256"
  },
  ALPNProtocols: ["spdy/1", "http/1.1"]
};

let tlsConnectOptions: socket.TLSConnectOptions = {
  address: addr,
  secureOptions: {
    ca: server_ca,
    key: client_key,
    cert: client_ca,
    protocols: [socket.Protocol.TLSv12],
    useRemoteCipherPrefer: true,
    signatureAlgorithms: "rsa_pss_rsae_sha256:ECDSA+SHA256",
    cipherSuite: "AES256-SHA256"
  },
  ALPNProtocols: ["spdy/1", "http/1.1"]
};

function expectEqual(exp: string | number | boolean, assert: string | number | boolean, info: string = ''): void {
  try {
    expect(exp).assertEqual(assert);
  } catch (err) {
    console.info(`${info} test failed`);
  }
}

function expectFail(info: string = ''): void {
  try {
    expect().assertFail();
  } catch (err) {
    console.info(`${info} test failed`);
  }
}

function expectTrue(exp: boolean, info: string = ''): void {
  try {
    expect(exp).assertTrue();
  } catch (err) {
    console.info(`${info} test failed`);
  }
}

export default function TLSSocketConnectionsTest() {
  describe('TLSSocketConnectionsTest', () => {

    /**
     * @tc.number  SUB_Network_Socket_TLSSocketConnection_Send_0100
     * @tc.name    testTLSSocketConnectionSendCallback0100
     * @tc.desc    Sending data through TLSSocketServer connection(data is 'Hello,client!') Use the callback method as the asynchronous method.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   level 3
     */
    it('testTLSSocketConnectionSendCallback0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,async (done: Function) => {
      let caseName: string = 'testTLSSocketConnectionSendCallback0100';
      console.info(`${caseName} test start`);
      try {
        tlsClient.bind(addr).then(() => {
          console.info(`${caseName} bind success`);
          tlsClient.connect(tlsConnectOptions).then(() => {
            console.info(`${caseName} connect successfully`);
          }).catch((err: BusinessError) => {
            console.info(`${caseName} connect fail: ${JSON.stringify(err)}`);
            done()
          })
          tlsServer.on('connect', (client: socket.TLSSocketConnection) => {
            console.info(`${caseName} clicent:${JSON.stringify(client)}}`);
            client.on('message', (value: socket.SocketMessageInfo) => {
              console.info(`${caseName} SocketMessageInfo:${JSON.stringify(value)} `);
            })
            client.send('Hello,client!', async (err: BusinessError) => {
              if (err) {
                expectTrue(false)
                await client.close().catch((err:BusinessError) => {
                    console.info('fail to close' + err.code.toString());
                });
                done()
              } else {
                expectTrue(true)
                await client.close().catch((err:BusinessError) => {
                    console.info('fail to close' + err.code.toString());
                });
                done()
              }
            })
          })
        }).catch((err: BusinessError) => {
          console.info(`${caseName} bind fail: ${JSON.stringify(err)}`);
          done()
        })
        tlsServer.listen(ServerOptions).then(() => {
          console.info(`${caseName} listen success`);
          expectTrue(true)
          done()
        }).catch((err: BusinessError) => {
          console.info(`${caseName} listen err:${JSON.stringify(err)}`);
          done()
        })
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        console.info(`${caseName} test end`);
        expectTrue(false)
        done();
      }
    });

    /**
     * @tc.number  SUB_Network_Socket_TLSSocketConnection_Send_0200
     * @tc.name    testTLSSocketConnectionSendCallback0200
     * @tc.desc    Sending data through TLSSocketServer connection(data is '') Use the callback method as the asynchronous method.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   level 3
     */
    it('testTLSSocketConnectionSendCallback0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,async (done: Function) => {
      let caseName: string = 'testTLSSocketConnectionSendCallback0200';
      console.info(`${caseName} test start`);
      try {
        tlsClient.bind(addr).then(() => {
          console.info(`${caseName} bind success`);
          tlsClient.connect(tlsConnectOptions).then(() => {
            console.info(`${caseName} connect successfully`);
          }).catch((err: BusinessError) => {
            console.info(`${caseName} connect fail: ${JSON.stringify(err)}`);
            done()
          })
          tlsServer.on('connect', (client: socket.TLSSocketConnection) => {
            console.info(`${caseName} clicent:${JSON.stringify(client)}}`);
            client.on('message', (value: socket.SocketMessageInfo) => {
              console.info(`${caseName} SocketMessageInfo:${JSON.stringify(value)} `);
            })
            client.send('', async (err: BusinessError) => {
              if (err) {
                console.info(`${caseName} send fail:${JSON.stringify(err)}`)
                expectEqual(err.code, 401)
                await client.close().catch((err:BusinessError) => {
                    console.info('fail to close' + err.code.toString());
                });
                done()
              } else {
                expectTrue(false)
                await client.close().catch((err:BusinessError) => {
                    console.info('fail to close' + err.code.toString());
                });
                done()
              }
            })
          })
        }).catch((err: BusinessError) => {
          console.info(`${caseName} bind fail: ${JSON.stringify(err)}`);
          done()
        })
        tlsServer.listen(ServerOptions).then(() => {
          console.info(`${caseName} listen success`);
          done()
        }).catch((err: BusinessError) => {
          console.info(`${caseName} listen err:${JSON.stringify(err)}`);
          done()
        })
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        console.info(`${caseName} test end`);
        expectTrue(false)
        done();
      }
    });

    /**
     * @tc.number  SUB_Network_Socket_TLSSocketConnection_Send_0300
     * @tc.name    testTLSSocketConnectionSendCallback0300
     * @tc.desc    Sending data through TLSSocketServer connection(send long message) Use the callback method as the asynchronous method.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   level 3
     */
    it('testTLSSocketConnectionSendCallback0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,async (done: Function) => {
      let caseName: string = 'testTLSSocketConnectionSendCallback0300';
      console.info(`${caseName} test start`);
      try {
        tlsClient.bind(addr).then(() => {
          console.info(`${caseName} bind success`);
          tlsClient.connect(tlsConnectOptions).then(() => {
            console.info(`${caseName} connect successfully`);
          }).catch((err: BusinessError) => {
            console.info(`${caseName} connect fail: ${JSON.stringify(err)}`);
            done()
          })
          tlsServer.on('connect', (client: socket.TLSSocketConnection) => {
            console.info(`${caseName} clicent:${JSON.stringify(client)}}`);
            client.on('message', (value: socket.SocketMessageInfo) => {
              console.info(`${caseName} SocketMessageInfo:${JSON.stringify(value)} `);
            })
            client.send(sendLongMessage, async (err: BusinessError) => {
              if (err) {
                console.info(`${caseName} send fail:${JSON.stringify(err)}`);
                expectTrue(false)
                await client.close().catch((err:BusinessError) => {
                    console.info('fail to close' + err.code.toString());
                });
                done()
              } else {
                console.info(`${caseName} send success`);
                expectTrue(true)
                await client.close().catch((err:BusinessError) => {
                    console.info('fail to close' + err.code.toString());
                });
                done()
              }
            })
          })
        }).catch((err: BusinessError) => {
          console.info(`${caseName} bind fail: ${JSON.stringify(err)}`);
          done()
        })
        tlsServer.listen(ServerOptions).then(() => {
          console.info(`${caseName} listen success`);
          done()
        }).catch((err: BusinessError) => {
          console.info(`${caseName} listen err:${JSON.stringify(err)}`);
          done()
        })
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        console.info(`${caseName} test end`);
        expectTrue(false)
        done();
      }
    });

    /**
     * @tc.number  SUB_Network_Socket_TLSSocketConnection_Send_0400
     * @tc.name    testTLSSocketConnectionSendCallback0400
     * @tc.desc    Sending data through TLSSocketServer connection(Send the normal data again after the send content is empty) Use the callback method as the asynchronous method.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   level 3
     */
    it('testTLSSocketConnectionSendCallback0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,async (done: Function) => {
      let caseName: string = 'testTLSSocketConnectionSendCallback0400';
      console.info(`${caseName} test start`);
      try {
        tlsClient.bind(addr).then(() => {
          console.info(`${caseName} bind success`);
          tlsClient.connect(tlsConnectOptions).then(() => {
            console.info(`${caseName} connect successfully`);
          }).catch((err: BusinessError) => {
            console.info(`${caseName} connect fail: ${JSON.stringify(err)}`);
            done()
          })
          tlsServer.on('connect', (client: socket.TLSSocketConnection) => {
            console.info(`${caseName} clicent:${JSON.stringify(client)}}`);
            client.on('message', (value: socket.SocketMessageInfo) => {
              console.info(`${caseName} SocketMessageInfo:${JSON.stringify(value)} `);
            })
            client.send('', async (err: BusinessError) => {
              if (err) {
                console.info(`${caseName} send fail:${JSON.stringify(err)}`);
                expectTrue(true)
                await client.close().catch((err:BusinessError) => {
                    console.info('fail to close' + err.code.toString());
                });
                done()
              } else {
                console.info(`${caseName} send success`);
                expectTrue(false)
                await client.close().catch((err:BusinessError) => {
                    console.info('fail to close' + err.code.toString());
                });
                done()
              }
            })
            /*again send*/
            client.send('hell Mr.Tree', async (err: BusinessError) => {
              if (err) {
                console.info(`${caseName} send fail:${JSON.stringify(err)}`);
                expectTrue(false)
                await client.close().catch((err:BusinessError) => {
                    console.info('fail to close' + err.code.toString());
                });
                done()
              } else {
                console.info(`${caseName} send success`);
                expectTrue(true)
                await client.close().catch((err:BusinessError) => {
                    console.info('fail to close' + err.code.toString());
                });
                done()
              }
            })
          })
        }).catch((err: BusinessError) => {
          console.info(`${caseName} bind fail: ${JSON.stringify(err)}`);
          done()
        })
        tlsServer.listen(ServerOptions).then(() => {
          console.info(`${caseName} listen success`);
          done()
        }).catch((err: BusinessError) => {
          console.info(`${caseName} listen err:${JSON.stringify(err)}`);
          done()
        })
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        console.info(`${caseName} test end`);
        expectTrue(false)
        done();
      }
    });

    /**
     * @tc.number  SUB_Network_Socket_TLSSocketConnection_Send_0500
     * @tc.name    testTLSSocketConnectionSendCallback0500
     * @tc.desc    Sending data through TLSSocketServer connection(repetition send long message) Use the callback method as the asynchronous method.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   level 3
     */
    it('testTLSSocketConnectionSendCallback0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,async (done: Function) => {
      let caseName: string = 'testTLSSocketConnectionSendCallback0500';
      console.info(`${caseName} test start`);
      try {
        tlsClient.bind(addr).then(() => {
          console.info(`${caseName} bind success`);
          tlsClient.connect(tlsConnectOptions).then(() => {
            console.info(`${caseName} connect successfully`);
          }).catch((err: BusinessError) => {
            console.info(`${caseName} connect fail: ${JSON.stringify(err)}`);
            done()
          })
          tlsServer.on('connect', (client: socket.TLSSocketConnection) => {
            console.info(`${caseName} clicent:${JSON.stringify(client)}}`);
            client.on('message', (value: socket.SocketMessageInfo) => {
              console.info(`${caseName} SocketMessageInfo:${JSON.stringify(value)} `);
            })
            client.send(sendLongMessage, async (err: BusinessError) => {
              if (err) {
                console.info(`${caseName} send fail:${JSON.stringify(err)}`);
                expectTrue(false)
                await client.close().catch((err:BusinessError) => {
                    console.info('fail to close' + err.code.toString());
                });
                done()
              } else {
                console.info(`${caseName} send success`);
                expectTrue(true)
                await client.close().catch((err:BusinessError) => {
                    console.info('fail to close' + err.code.toString());
                });
                done()
              }
            })
            client.send(sendLongMessage, async (err: BusinessError) => {
              if (err) {
                console.info(`${caseName} send fail:${JSON.stringify(err)}`);
                expectTrue(false)
                await client.close().catch((err:BusinessError) => {
                    console.info('fail to close' + err.code.toString());
                });
                done()
              } else {
                console.info(`${caseName} send success`);
                expectTrue(true)
                await client.close().catch((err:BusinessError) => {
                    console.info('fail to close' + err.code.toString());
                });
                done()
              }
            })
          })
        }).catch((err: BusinessError) => {
          console.info(`${caseName} bind fail: ${JSON.stringify(err)}`);
          done()
        })
        tlsServer.listen(ServerOptions).then(() => {
          console.info(`${caseName} listen success`);
          done()
        }).catch((err: BusinessError) => {
          console.info(`${caseName} listen err:${JSON.stringify(err)}`);
          done()
        })
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        console.info(`${caseName} test end`);
        expectTrue(false)
        done();
      }
    });

    /**
     * @tc.number  SUB_Network_Socket_TLSSocketConnection_SendPromise_0100
     * @tc.name    testTLSSocketConnectionSendPromise0100
     * @tc.desc    Sending data through TLSSocketServer connection(data is 'hell word!') Use the promise method as the asynchronous method.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   level 3
     */
    it('testTLSSocketConnectionSendPromise0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,async (done: Function) => {
      let caseName: string = 'testTLSSocketConnectionSendPromise0100';
      console.info(`${caseName} test start`);
      try {
        tlsClient.bind(addr).then(() => {
          console.info(`${caseName} bind success`);
          tlsClient.connect(tlsConnectOptions).then(() => {
            console.info(`${caseName} connect successfully`);
          }).catch((err: BusinessError) => {
            console.info(`${caseName} connect fail: ${JSON.stringify(err)}`);
            done()
          })
          tlsServer.on('connect', (client: socket.TLSSocketConnection) => {
            console.info(`${caseName} clicent:${JSON.stringify(client)}}`);
            client.on('message', (value: socket.SocketMessageInfo) => {
              console.info(`${caseName} SocketMessageInfo:${JSON.stringify(value)} `);
            })
            client.send('hell word!').then(async () => {
              console.info(`${caseName} send success`);
              await client.close().catch((err:BusinessError) => {
                    console.info('fail to close' + err.code.toString());
                });
              done()
            }).catch(async (err: BusinessError) => {
              console.info(`${caseName} send fail:${JSON.stringify(err)}`);
              expectTrue(false)
              await client.close().catch((err:BusinessError) => {
                    console.info('fail to close' + err.code.toString());
                });
              done()
            })
          })
        }).catch((err: BusinessError) => {
          console.info(`${caseName} bind fail: ${JSON.stringify(err)}`);
          done()
        })
        tlsServer.listen(ServerOptions).then(() => {
          console.info(`${caseName} listen success`);
          done()
        }).catch((err: BusinessError) => {
          console.info(`${caseName} listen err:${JSON.stringify(err)}`);
          done()
        })
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        console.info(`${caseName} test end`);
        expectTrue(false)
        done();
      }
    });

    /**
     * @tc.number  SUB_Network_Socket_TLSSocketConnection_SendPromise_0200
     * @tc.name    testTLSSocketConnectionSendPromise0200
     * @tc.desc    Sending data through TLSSocketServer connection(send long message) Use the promise method as the asynchronous method.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   level 3
     */
    it('testTLSSocketConnectionSendPromise0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,async (done: Function) => {
      let caseName: string = 'testTLSSocketConnectionSendPromise0200';
      console.info(`${caseName} test start`);
      try {
        tlsClient.bind(addr).then(() => {
          console.info(`${caseName} bind success`);
          tlsClient.connect(tlsConnectOptions).then(() => {
            console.info(`${caseName} connect successfully`);
          }).catch((err: BusinessError) => {
            console.info(`${caseName} connect fail: ${JSON.stringify(err)}`);
            done()
          })
          tlsServer.on('connect', (client: socket.TLSSocketConnection) => {
            console.info(`${caseName} clicent:${JSON.stringify(client)}}`);
            client.on('message', (value: socket.SocketMessageInfo) => {
              console.info(`${caseName} SocketMessageInfo:${JSON.stringify(value)} `);
            })
            client.send(sendLongMessage).then(async () => {
              console.info(`${caseName} send success`);
              await client.close().catch((err:BusinessError) => {
                    console.info('fail to close' + err.code.toString());
                });
            }).catch(async (err: BusinessError) => {
              console.info(`${caseName} send fail:${JSON.stringify(err)}`);
              expectTrue(false)
              await client.close().catch((err:BusinessError) => {
                    console.info('fail to close' + err.code.toString());
                });
              done()
            })
          })
        }).catch((err: BusinessError) => {
          console.info(`${caseName} bind fail: ${JSON.stringify(err)}`);
          done()
        })
        tlsServer.listen(ServerOptions).then(() => {
          console.info(`${caseName} listen success`);
          done()
        }).catch((err: BusinessError) => {
          console.info(`${caseName} listen err:${JSON.stringify(err)}`);
          done()
        })
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        console.info(`${caseName} test end`);
        expectTrue(false)
        done();
      }
    });

    /**
     * @tc.number  SUB_Network_Socket_TLSSocketConnection_SendPromise_0300
     * @tc.name    testTLSSocketConnectionSendPromise0300
     * @tc.desc    Sending data through TLSSocketServer connection(data is '') Use the promise method as the asynchronous method.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   level 3
     */
    it('testTLSSocketConnectionSendPromise0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,async (done: Function) => {
      let caseName: string = 'testTLSSocketConnectionSendPromise0300';
      console.info(`${caseName} test start`);
      try {
        tlsClient.bind(addr).then(() => {
          console.info(`${caseName} bind success`);
          tlsClient.connect(tlsConnectOptions).then(() => {
            console.info(`${caseName} connect successfully`);
          }).catch((err: BusinessError) => {
            console.info(`${caseName} connect fail: ${JSON.stringify(err)}`);
            done()
          })
          tlsServer.on('connect', (client: socket.TLSSocketConnection) => {
            console.info(`${caseName} clicent:${JSON.stringify(client)}}`);
            client.on('message', (value: socket.SocketMessageInfo) => {
              console.info(`${caseName} SocketMessageInfo:${JSON.stringify(value)} `);
            })
            client.send('').then(async () => {
              console.info(`${caseName} send success`);
              expectTrue(false)
              await client.close().catch((err:BusinessError) => {
                    console.info('fail to close' + err.code.toString());
                });
              done()
            }).catch(async (err: BusinessError) => {
              console.info(`${caseName} send fail:${JSON.stringify(err)}`);
              expectEqual(err.code, 401)
              await client.close().catch((err:BusinessError) => {
                    console.info('fail to close' + err.code.toString());
                });
              done()
            })
          })
        }).catch((err: BusinessError) => {
          console.info(`${caseName} bind fail: ${JSON.stringify(err)}`);
          done()
        })
        tlsServer.listen(ServerOptions).then(() => {
          console.info(`${caseName} listen success`);
          done()
        }).catch((err: BusinessError) => {
          console.info(`${caseName} listen err:${JSON.stringify(err)}`);
          done()
        })
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        console.info(`${caseName} test end`);
        expectTrue(false)
        done();
      }
    });

    /**
     * @tc.number  SUB_Network_Socket_TLSSocketConnection_SendPromise_0400
     * @tc.name    testTLSSocketConnectionSendPromise0400
     * @tc.desc    Sending data through TLSSocketServer connection(Send the normal data again after the send content is empty) Use the promise method as the asynchronous method.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   level 3
     */
    it('testTLSSocketConnectionSendPromise0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,async (done: Function) => {
      let caseName: string = 'testTLSSocketConnectionSendPromise0400';
      console.info(`${caseName} test start`);
      try {
        tlsClient.bind(addr).then(() => {
          console.info(`${caseName} bind success`);
          tlsClient.connect(tlsConnectOptions).then(() => {
            console.info(`${caseName} connect successfully`);
          }).catch((err: BusinessError) => {
            console.info(`${caseName} connect fail: ${JSON.stringify(err)}`);
            done()
          })
          tlsServer.on('connect', (client: socket.TLSSocketConnection) => {
            console.info(`${caseName} clicent:${JSON.stringify(client)}}`);
            client.on('message', (value: socket.SocketMessageInfo) => {
              console.info(`${caseName} SocketMessageInfo:${JSON.stringify(value)} `);
            })
            client.send('').then(async () => {
              console.info(`${caseName} send success`);
              expectTrue(false)
              await client.close().catch((err:BusinessError) => {
                    console.info('fail to close' + err.code.toString());
                });
              done()
            }).catch(async (err: BusinessError) => {
              console.info(`${caseName} send fail:${JSON.stringify(err)}`);
              expectEqual(err.code, 401)
              await client.close().catch((err:BusinessError) => {
                    console.info('fail to close' + err.code.toString());
                });
              done()
            })
            /*again send*/
            client.send('hello Mr.Tree').then(async () => {
              console.info(`${caseName} send success`);
              expectTrue(true)
              await client.close().catch((err:BusinessError) => {
                    console.info('fail to close' + err.code.toString());
                });
              done()
            }).catch(async (err: BusinessError) => {
              console.info(`${caseName} send fail:${JSON.stringify(err)}`);
              expectTrue(false)
              await client.close().catch((err:BusinessError) => {
                    console.info('fail to close' + err.code.toString());
                });
              done()
            })
          })
        }).catch((err: BusinessError) => {
          console.info(`${caseName} bind fail: ${JSON.stringify(err)}`);
          done()
        })
        tlsServer.listen(ServerOptions).then(() => {
          console.info(`${caseName} listen success`);
          done()
        }).catch((err: BusinessError) => {
          console.info(`${caseName} listen err:${JSON.stringify(err)}`);
          done()
        })
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        console.info(`${caseName} test end`);
        expectTrue(false)
        done();
      }
    });

    /**
     * @tc.number  SUB_Network_Socket_TLSSocketConnection_SendPromise_0500
     * @tc.name    testTLSSocketConnectionSendPromise0500
     * @tc.desc    Sending data through TLSSocketServer connection(twice Send ) Use the promise method as the asynchronous method.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   level 3
     */
    it('testTLSSocketConnectionSendPromise0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,async (done: Function) => {
      let caseName: string = 'testTLSSocketConnectionSendPromise0500';
      console.info(`${caseName} test start`);
      try {
        tlsClient.bind(addr).then(() => {
          console.info(`${caseName} bind success`);
          tlsClient.connect(tlsConnectOptions).then(() => {
            console.info(`${caseName} connect successfully`);
          }).catch((err: BusinessError) => {
            console.info(`${caseName} connect fail: ${JSON.stringify(err)}`);
            done()
          })
          tlsServer.on('connect', (client: socket.TLSSocketConnection) => {
            console.info(`${caseName} clicent:${JSON.stringify(client)}}`);
            client.on('message', (value: socket.SocketMessageInfo) => {
              console.info(`${caseName} SocketMessageInfo:${JSON.stringify(value)} `);
            })
            client.send('hello word!').then(async () => {
              console.info(`${caseName} send success`);
              expectTrue(true)
              await client.close().catch((err:BusinessError) => {
                    console.info('fail to close' + err.code.toString());
                });
              done()
            }).catch(async (err: BusinessError) => {
              console.info(`${caseName} send fail:${JSON.stringify(err)}`);
              expectTrue(false)
              await client.close().catch((err:BusinessError) => {
                    console.info('fail to close' + err.code.toString());
                });
              done()
            })
            /*again send*/
            client.send('hello Mr.Tree').then(async () => {
              console.info(`${caseName} send success`);
              expectTrue(true)
              await client.close().catch((err:BusinessError) => {
                    console.info('fail to close' + err.code.toString());
                });
              done()
            }).catch(async (err: BusinessError) => {
              console.info(`${caseName} send fail:${JSON.stringify(err)}`);
              expectTrue(false)
              await client.close().catch((err:BusinessError) => {
                    console.info('fail to close' + err.code.toString());
                });
              done()
            })
          })
        }).catch((err: BusinessError) => {
          console.info(`${caseName} bind fail: ${JSON.stringify(err)}`);
          done()
        })
        tlsServer.listen(ServerOptions).then(() => {
          console.info(`${caseName} listen success`);
          done()
        }).catch((err: BusinessError) => {
          console.info(`${caseName} listen err:${JSON.stringify(err)}`);
          done()
        })
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        console.info(`${caseName} test end`);
        expectTrue(false)
        done();
      }
    });

    /**
     * @tc.number  SUB_NetworkMgr_TLSSocketConnection_GetCipherSuite_0100
     * @tc.name    testetworkMgrTLSSocketConnectionGetCipherSuite0100
     * @tc.desc    Get the cipher suite negotiated by both parties, Use the callback method as the asynchronous method.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   level 3
     */
    it('testetworkMgrTLSSocketConnectionGetCipherSuite0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,async (done: Function) => {
      let caseName: string = 'testetworkMgrTLSSocketConnectionGetCipherSuite0100';
      console.info(`${caseName} test start`);
      try {
        tlsClient.bind(addr).then(() => {
          console.info(`${caseName} bind success`);
          tlsClient.connect(tlsConnectOptions).then(() => {
            console.info(`${caseName} connect successfully`);
            tlsClient.getCipherSuite(async (err: BusinessError, data: Array<string>) => {
              if (err) {
                console.error(`${caseName} Client getCipherSuite callback error: ${JSON.stringify(err)}`);
                expectTrue(false);
                done();
              } else {
                console.info(`${caseName} Client getCipherSuite callback =` + data);
                expect(data.length > 0).assertTrue();
                done();
              }
            });
          }).catch((err: BusinessError) => {
            console.info(`${caseName} connect fail: ${JSON.stringify(err)}`);
            done();
          });
          tlsServer.on('connect', (client: socket.TLSSocketConnection) => {
            console.info(`${caseName} clicent:${JSON.stringify(client)}}`);
            client.getCipherSuite(async (err: BusinessError, data: Array<string>) => {
              if (err) {
                console.error(`${caseName} Server getCipherSuite callback error: ${JSON.stringify(err)}`);
                expectTrue(false);
                done();
              } else {
                console.info(`${caseName} Server getCipherSuite callback =` + data);
                expect(data.length > 0).assertTrue();
              }
            });
          });
        }).catch((err: BusinessError) => {
          console.info(`${caseName} bind fail: ${JSON.stringify(err)}`);
          done();
        });
        tlsServer.listen(ServerOptions).then(() => {
          console.info(`${caseName} listen success`);
          expectTrue(true);
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} listen err:${JSON.stringify(err)}`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        console.info(`${caseName} test end`);
        expectTrue(false);
        done();
      }
    });

    /**
     * @tc.number  SUB_NetworkMgr_TLSSocketConnection_GetCipherSuite_0200
     * @tc.name    testetworkMgrTLSSocketConnectionGetCipherSuite0200
     * @tc.desc    Get the cipher suite negotiated by both parties, Use the Promise method as the asynchronous method.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   level 3
     */
    it('testetworkMgrTLSSocketConnectionGetCipherSuite0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,async (done: Function) => {
      let caseName: string = 'testetworkMgrTLSSocketConnectionGetCipherSuite0200';
      console.info(`${caseName} test start`);
      try {
        tlsClient.bind(addr).then(() => {
          console.info(`${caseName} bind success`);
          tlsClient.connect(tlsConnectOptions).then(() => {
            console.info(`${caseName} connect successfully`);
            tlsClient.getCipherSuite().then((data: Array<string>) => {
              console.info(`${caseName} Client getCipherSuite callback =` + data);
              expect(data.length > 0).assertTrue();
              done();
            }).catch ((err: BusinessError) => {
              console.error(`${caseName} Client getCipherSuite callback error: ${JSON.stringify(err)}`);
              expectTrue(false);
              done();
            });
          }).catch((err: BusinessError) => {
            console.info(`${caseName} connect fail: ${JSON.stringify(err)}`);
            done();
          });
          tlsServer.on('connect', (client: socket.TLSSocketConnection) => {
            console.info(`${caseName} clicent:${JSON.stringify(client)}}`);
            client.getCipherSuite().then((data: Array<string>) => {
              console.info(`${caseName} Server getCipherSuite callback =` + data);
              expect(data.length > 0).assertTrue();
            }).catch ((err: BusinessError) => {
              console.error(`${caseName} Server getCipherSuite callback error: ${JSON.stringify(err)}`);
              expectTrue(false);
              done();
            });
          });
        }).catch((err: BusinessError) => {
          console.info(`${caseName} bind fail: ${JSON.stringify(err)}`);
          done();
        });
        tlsServer.listen(ServerOptions).then(() => {
          console.info(`${caseName} listen success`);
          expectTrue(true);
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} listen err:${JSON.stringify(err)}`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        console.info(`${caseName} test end`);
        expectTrue(false);
        done();
      }
    });

    /**
     * @tc.number  SUB_NetworkMgr_TLSSocketConnection_GetSignatureAlgorithms_0100
     * @tc.name    testetworkMgrTLSSocketConnectiongetSignatureAlgorithms0100
     * @tc.desc    Get the signature algorithms negotiated by both parties, Use the callback method as the asynchronous method.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   level 3
     */
    it('testetworkMgrTLSSocketConnectiongetSignatureAlgorithms0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,async (done: Function) => {
      let caseName: string = 'testetworkMgrTLSSocketConnectiongetSignatureAlgorithms0100';
      console.info(`${caseName} test start`);
      try {
        let tlsConnectOptions_Server: socket.TLSConnectOptions = {
          address: addr,
          secureOptions: {
            ca: client_ca,
            key: server_key,
            password: '123456',
            cert: server_ca,
            protocols: [socket.Protocol.TLSv12],
            useRemoteCipherPrefer: true,
            signatureAlgorithms: "rsa_pss_rsae_sha256:ECDSA+SHA256",
            cipherSuite: "AES256-SHA256",
            isBidirectionalAuthentication: true
          },
          ALPNProtocols: ["spdy/1", "http/1.1"]
        };
        let tlsConnectOptions_Client: socket.TLSConnectOptions = {
          address: addr,
          secureOptions: {
            ca: server_ca,
            key: client_key,
            cert: client_ca,
            protocols: [socket.Protocol.TLSv12],
            useRemoteCipherPrefer: true,
            signatureAlgorithms: "rsa_pss_rsae_sha256:ECDSA+SHA256",
            cipherSuite: "AES256-SHA256",
            isBidirectionalAuthentication: true
          },
          ALPNProtocols: ["spdy/1", "http/1.1"]
        };
        tlsClient.bind(addr).then(() => {
          console.info(`${caseName} bind success`);
          tlsClient.connect(tlsConnectOptions_Client).then(() => {
            console.info(`${caseName} connect successfully`);
            tlsClient.getSignatureAlgorithms(async (err: BusinessError, data: Array<string>) => {
              if (err) {
                console.error(`${caseName} Client getSignatureAlgorithms callback error: ${JSON.stringify(err)}`);
                expectTrue(false);
                done();
              } else {
                console.info(`${caseName} Client getSignatureAlgorithms callback =` + data);
                expect(data.length > 0).assertTrue();
                done();
              }
            });
          }).catch((err: BusinessError) => {
            console.info(`${caseName} connect fail: ${JSON.stringify(err)}`);
            done();
          });
          tlsServer.on('connect', (client: socket.TLSSocketConnection) => {
            console.info(`${caseName} clicent:${JSON.stringify(client)}}`);
            client.getSignatureAlgorithms(async (err: BusinessError, data: Array<string>) => {
              if (err) {
                console.error(`${caseName} Server getSignatureAlgorithms callback error: ${JSON.stringify(err)}`);
                expectTrue(false);
                done();
              } else {
                console.info(`${caseName} Server getSignatureAlgorithms callback =` + data);
                expect(data.length > 0).assertTrue();
              }
            });
          });
        }).catch((err: BusinessError) => {
          console.info(`${caseName} bind fail: ${JSON.stringify(err)}`);
          done();
        });
        tlsServer.listen(tlsConnectOptions_Server).then(() => {
          console.info(`${caseName} listen success`);
          expectTrue(true);
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} listen err:${JSON.stringify(err)}`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        console.info(`${caseName} test end`);
        expectTrue(false);
        done();
      }
    });

    /**
     * @tc.number  SUB_NetworkMgr_TLSSocketConnection_GetSignatureAlgorithms_0200
     * @tc.name    testetworkMgrTLSSocketConnectiongetSignatureAlgorithms0200
     * @tc.desc    Get the signature algorithms negotiated by both parties, Use the Promise method as the asynchronous method.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   level 3
     */
    it('testetworkMgrTLSSocketConnectiongetSignatureAlgorithms0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,async (done: Function) => {
      let caseName: string = 'testetworkMgrTLSSocketConnectiongetSignatureAlgorithms0200';
      console.info(`${caseName} test start`);
      try {
        let tlsConnectOptions_Server: socket.TLSConnectOptions = {
          address: addr,
          secureOptions: {
            ca: client_ca,
            key: server_key,
            password: '123456',
            cert: server_ca,
            protocols: [socket.Protocol.TLSv12],
            useRemoteCipherPrefer: true,
            signatureAlgorithms: "rsa_pss_rsae_sha256:ECDSA+SHA256",
            cipherSuite: "AES256-SHA256",
            isBidirectionalAuthentication: true
          },
          ALPNProtocols: ["spdy/1", "http/1.1"]
        };
        let tlsConnectOptions_Client: socket.TLSConnectOptions = {
          address: addr,
          secureOptions: {
            ca: server_ca,
            key: client_key,
            cert: client_ca,
            protocols: [socket.Protocol.TLSv12],
            useRemoteCipherPrefer: true,
            signatureAlgorithms: "rsa_pss_rsae_sha256:ECDSA+SHA256",
            cipherSuite: "AES256-SHA256",
            isBidirectionalAuthentication: true
          },
          ALPNProtocols: ["spdy/1", "http/1.1"]
        };
        tlsClient.bind(addr).then(() => {
          console.info(`${caseName} bind success`);
          tlsClient.connect(tlsConnectOptions_Client).then(() => {
            console.info(`${caseName} connect successfully`);
            tlsClient.getSignatureAlgorithms().then((data: Array<string>) => {
              console.info(`${caseName} Client getSignatureAlgorithms callback =` + data);
              expect(data.length > 0).assertTrue();
              done();
            }).catch ((err: BusinessError) => {
              console.error(`${caseName} Client getSignatureAlgorithms callback error: ${JSON.stringify(err)}`);
              expectTrue(false);
              done();
            });
          }).catch((err: BusinessError) => {
            console.info(`${caseName} connect fail: ${JSON.stringify(err)}`);
            done();
          });
          tlsServer.on('connect', (client: socket.TLSSocketConnection) => {
            console.info(`${caseName} clicent:${JSON.stringify(client)}}`);
            client.getSignatureAlgorithms().then((data: Array<string>) => {
              console.info(`${caseName} Server getSignatureAlgorithms callback =` + data);
              expect(data.length > 0).assertTrue();
            }).catch ((err: BusinessError) => {
              console.error(`${caseName} Server getSignatureAlgorithms callback error: ${JSON.stringify(err)}`);
              expectTrue(false);
              done();
            });
          });
        }).catch((err: BusinessError) => {
          console.info(`${caseName} bind fail: ${JSON.stringify(err)}`);
          done();
        });
        tlsServer.listen(tlsConnectOptions_Server).then(() => {
          console.info(`${caseName} listen success`);
          expectTrue(true);
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} listen err:${JSON.stringify(err)}`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        console.info(`${caseName} test end`);
        expectTrue(false);
        done();
      }
    });

   /**
     * @tc.number  SUB_Network_Socket_TLSSocketConnection_Timeout_0100
     * @tc.name    testNetworkSocketTLSSocketConnectionTimeout0100
     * @tc.desc    Check whether the TLS timeout connection is normal.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   level 3
     */
    it('testNetworkSocketTLSSocketConnectionTimeout0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,async (done: Function) => {
      let caseName: string = 'testNetworkSocketTLSSocketConnectionTimeout0100';
      let tlsServer1: socket.TLSSocketServer = socket.constructTLSSocketServerInstance();
      let tlsClient1: socket.TLSSocket = socket.constructTLSSocketInstance();
      console.info(`${caseName} test start`);
      try {
        let addr1: socket.NetAddress = {
            address: '127.0.0.1',
            port: 8001,
            family: 1
        };
        let tlsTimeOutOptions1: socket.TLSConnectOptions = {
          address: addr1,
          secureOptions: {
            ca: server_ca,
            key: client_key,
            cert: client_ca,
            protocols: [socket.Protocol.TLSv12],
            useRemoteCipherPrefer: true,
            signatureAlgorithms: "rsa_pss_rsae_sha256:ECDSA+SHA256",
            cipherSuite: "AES256-SHA256",
          },
          ALPNProtocols: ["spdy/1", "http/1.1"],
          timeout: 1
        };
         tlsServer1.listen(ServerOptions).then(() => {
          console.info(`${caseName} listen success`);
          expectTrue(true);
        }).catch((err: BusinessError) => {
          console.info(`${caseName} listen err:${JSON.stringify(err)}`);
          expectFail();
          tlsServer1.close();
          done();
        });
        tlsClient1.bind(addr1).then(() => {
          console.info(`${caseName} bind success`);
          tlsClient1.connect(tlsTimeOutOptions1).then(() => {
            console.info(`${caseName} connect successfully`);
            expectFail();
            tlsServer1.close();
            done();
          }).catch((err: BusinessError) => {
            console.info(`${caseName} connect fail: ${JSON.stringify(err)}`);
            expectTrue(err.code == 2303501 || err.code == 2303502);
            tlsServer1.close();
            done();
          })
        }).catch((err: BusinessError) => {
          console.info(`${caseName} bind fail:${JSON.stringify(err)}`);
          expectFail();
          tlsServer1.close();
          done();
        });
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        console.info(`${caseName} test end`);
        expectTrue(false)
        done();
      }
    });
   
  });
}