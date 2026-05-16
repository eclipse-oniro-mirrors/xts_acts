/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
 *
 *
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
import HashMap from '@ohos.util.HashMap';


interface KeyPairPemString {
  algName?: string;
  pubKey: string;
  priKey: string;
}

let stub_all: KeyPairPemString[] = [
  {
    algName: "DH_ffdhe2048",
    priKey:
      '-----BEGIN PRIVATE KEY-----\n'                                      +
      'MIIBPgIBADCCARcGCSqGSIb3DQEDATCCAQgCggEBAP//////////rfhUWKK7Spqv\n' +
      '3FYgJz088di5xYPOLTaVqeE2QRRkM/vMk53OJJs++X0v42NjDHXY9oGyAq7EYXrT\n' +
      '3x7V1f1lYSQz9R9fBm7QhWNlVT3tGvO1VxNef1fJNZhPDHDg5ot34qaJ2vPv6HId\n' +
      '8VihNq3nNTCsyk9IOnl6vAqxgrMk+2HRCKlLssjj+7lq2rdg1/RoHU9Co945TfSu\n' +
      'Vu3nY3K7GQsHp8juCm1wngL84c334uzANATNKDQvYZFy/pzphYP/jk8SMu7ygYPD\n' +
      '/jsbTG+tczu1/LwuwiAFxY7xg30Wg7LG80omwbLv+ohrQjhhKFyX//////////8C\n' +
      'AQIEHgIcGKtpBSJ6ynrM2Rg7qkDdW7X+m++asD+6SC802w==\n'                 +
      '-----END PRIVATE KEY-----\n',
    pubKey:
      '-----BEGIN PUBLIC KEY-----\n'                                       +
      'MIICJDCCARcGCSqGSIb3DQEDATCCAQgCggEBAP//////////rfhUWKK7Spqv3FYg\n' +
      'Jz088di5xYPOLTaVqeE2QRRkM/vMk53OJJs++X0v42NjDHXY9oGyAq7EYXrT3x7V\n' +
      '1f1lYSQz9R9fBm7QhWNlVT3tGvO1VxNef1fJNZhPDHDg5ot34qaJ2vPv6HId8Vih\n' +
      'Nq3nNTCsyk9IOnl6vAqxgrMk+2HRCKlLssjj+7lq2rdg1/RoHU9Co945TfSuVu3n\n' +
      'Y3K7GQsHp8juCm1wngL84c334uzANATNKDQvYZFy/pzphYP/jk8SMu7ygYPD/jsb\n' +
      'TG+tczu1/LwuwiAFxY7xg30Wg7LG80omwbLv+ohrQjhhKFyX//////////8CAQID\n' +
      'ggEFAAKCAQA1G0jXzEUud84JTEYQR1so10cHHY6t4lGVBhDCrxAlxrGS1egcVOW7\n' +
      'y0fb2w10d7Bd33lV93NUFOrEs7d8MOuDJMnlU0reWAhEKWUIBXI+gevDTVRIJIOj\n' +
      'xSrxNbEZr05uaxGUbFEhLYhi84YtVuPqXGY7Wt2lDt7I7q2BTa0KMs+HdwR3B6dk\n' +
      'r0NahPqxo2ujqLUSErxSlxJTIxn/nzQUzFvMwxZLP3RgtSEO9Lb7l7G5jxgPbslP\n' +
      'ePDR96dyH1mmAoISiPPN3K6Jm7VYj9I5njhpMEZsm86ZZM7VKYu7ydnlx+eC3uPI\n' +
      'HxIuqdc4j3xnm/X+suV7W+c1s2joCJF4\n'                                 +
      '-----END PUBLIC KEY-----\n'
  },
  {
    algName: "ECC224",
    priKey:
      '-----BEGIN PRIVATE KEY-----\n'                                      +
      'MHgCAQAwEAYHKoZIzj0CAQYFK4EEACEEYTBfAgEBBBwG4S0OeZ3qf6Nn1spQJJTt\n' +
      'eVtMXgGNIqeQv3nVoTwDOgAE+IGQSpfmiPvaWwrinnRySYg/NeimiYvzY+j5wnM+\n' +
      'dXy40IDQd/3XVJ+Q7D3brvB1Y7cO/ZmaPtM=\n'                             +
      '-----END PRIVATE KEY-----\n',
    pubKey:
      '-----BEGIN PUBLIC KEY-----\n'                                       +
      'ME4wEAYHKoZIzj0CAQYFK4EEACEDOgAE+IGQSpfmiPvaWwrinnRySYg/NeimiYvz\n' +
      'Y+j5wnM+dXy40IDQd/3XVJ+Q7D3brvB1Y7cO/ZmaPtM=\n'                     +
      '-----END PUBLIC KEY-----\n'
  },
  {
    algName: "ECC256",
    priKey:
      '-----BEGIN PRIVATE KEY-----\n'                                      +
      'MIGHAgEAMBMGByqGSM49AgEGCCqGSM49AwEHBG0wawIBAQQg6GwZ+GSEWijUewRn\n' +
      'aLRhuussHgbsvJiQ0jMRH4nWo0ehRANCAASFVTq+7i9GWSYVXOKvQhZPIuos//e/\n' +
      'FV+ICHivpP/NFIm0OIM5tf3QzQRKsMyY31YlBTKAznHIx6Xfi5vTfVZb\n'         +
      '-----END PRIVATE KEY-----\n',
    pubKey:
      '-----BEGIN PUBLIC KEY-----\n'                                       +
      'MFkwEwYHKoZIzj0CAQYIKoZIzj0DAQcDQgAEhVU6vu4vRlkmFVzir0IWTyLqLP/3\n' +
      'vxVfiAh4r6T/zRSJtDiDObX90M0ESrDMmN9WJQUygM5xyMel34ub031WWw==\n'     +
      '-----END PUBLIC KEY-----\n'
  },
  {
    algName: "DSA1024",
    priKey:
      '-----BEGIN PRIVATE KEY-----\n'                                      +
      'MIIBWwIBADCCATQGByqGSM44BAEwggEnAoGBAKszTLEFGoGi6T/u+FnoHZqOKR/a\n' +
      'Tm1ADs0XsEKGFrMrups3zVouveK9lqLhkAnRji80u0RXkqz9STk3hEAh935WHnmC\n' +
      'ldKY3a/X8rw6c8BFq9O3ZaoLoPEK2vw02VIuwi9QOLpdPI0PcKRTZRwLH0HYme6m\n' +
      'UzpAwnd7Vl9DkWwRAh0A3uCKW85t431mK4A3tXL7A0iAdiBVD0Tw6wmfgwKBgQCk\n' +
      'Koi4pP3K1wEwLFqbMyg2KJ9lthP1GsnGftTilf1uYmR0YEXkIw18liXXLFITf5Kf\n' +
      'IbcrUtF7DqYXUol0WD7yLjCbuF46m/U7PcaNXfh21GJS1l7rl17AOuM3aJ9xr3FC\n' +
      'xtBPwCTiCYlVkpOYCy1cqGn8+ghWBtAVGEcjzyusWwQeAhxmySg7uETSAJwbG8X4\n' +
      'cw7ub6PfhYgJfrKEI3Yw\n'                                             +
      '-----END PRIVATE KEY-----\n',
    pubKey:
      '-----BEGIN PUBLIC KEY-----\n'                                       +
      'MIIBtzCCASsGByqGSM44BAEwggEeAoGBANdaKLgz0spoF+aH4HbSRWaTlgOod2Og\n' +
      'uqquAQg9jTfXxqhO9vRiIOG2srl+zUEDuWUROKj6qiJ3o4U/TZhR6C4NGckIh+G4\n' +
      'fzFj4Ga1TlPr+3bIDuUJD5/5k8Je4tpxRPai1koce6DZrY4zmM22IdLGl5Uwh1eX\n' +
      'CgpoXI8A0CCXAhUAjJCO/9KIgEhDLIcqoOLoL11Md/UCgYABIf5VzvpImxjt0bUi\n' +
      '+PrEt/DAUDfA1ifF5xtEqOJEfdRPmeuZS4Q213ttGWkwggWsBK9wD6DA94dKLXvQ\n' +
      '4vtIDVq0RzsIVh/dOMhxqtSNwffUbeTU3+VVCEoPJyjrM/Sv1KI9BZmawy3MdSFj\n' +
      'ld+Sgi8JBKvwlOpA42wXpruozQOBhQACgYEA1DWLVJBjEUGMJqj13QnPkMgImeNy\n' +
      'jcOH66R5ZnOv4vWsCh0QxaEVmC0HNNria+PABGC98ILSYZKZ7H3ZSWivEuwVqZ6s\n' +
      'RdHWydM24wv92bxqOKiyAp/UE8JjkWYMlU68XeHnG22V6qeWdui5+3mJSs99LYaB\n' +
      'fmPc8qKx9W/F/6g=\n'                                                 +
      '-----END PUBLIC KEY-----\n'
  },
  {
    algName: "DSA2048",
    priKey:
      '-----BEGIN PRIVATE KEY-----\n'                                      +
      'MIICXAIBADCCAjUGByqGSM44BAEwggIoAoIBAQCTQpPC0XKDO8Gl6AQWHeUtcK0K\n' +
      'k06VEGrsM9kql5QTGlw0kgxWJ/OEHnwYnjoWlrfpm2OFwEYQrMOxL7g7bB3W5VPW\n' +
      'mCF+lYxm1Q60ZENVA5D2qyGlfTEeggqid8lvMs5sE52TJJPBTzUTb8+jS+HM3Jez\n' +
      'fxNPcg0YVJfQP7IKIVzMo6zgtAVRbYqwNMMvEt5sVaAgnZVxeyHyDZFpfuEkFIOw\n' +
      'tFJ5ZR0K79eNBGPOji1qAsUp4r2Ps+V2Zhku+eO4Ts2dwjtDAX0oNEXFRQlo0l7E\n' +
      'jPEt7eloJWccPh+Yuj688HfpHrFve3xKHA6XL2k8pjMsKUjftJ4/iFCOVXXTAh0A\n' +
      'm43NQ9rnaVQuRTL2lYgYz7E3xTKgln+N14eyzQKCAQAoZROu+D0rzK9MxO9+I4sX\n' +
      'RJ6gHtcJfy0FRY1+tRArB5lh0kuzpo/hL3WPthlQIpzpyD2g84iw2KqEKgOu12t9\n' +
      '/gITgWwcSzxxqa6xyuZv2vcMdHoJX5nCBLBv9rimTSKk9gpLIrai8ZJHN5ZgxS42\n' +
      'de01aujOLRGEou2zbj2OzGXC3uO+Meir9Y1s0GDX4NI2lgJENvho1e9kHRdCuIFJ\n' +
      'JkwaX953j0Gi0MXuegQ3xRLzZEQSWQx2lqLHDTL19q50elA0XXv46p5asH0/HfYA\n' +
      'jAiH7knH7zMybYxU4o3b8U/9qGO/qcvUsCIAAfXprCurgrnb4tTpu8a6o4itH63P\n' +
      'BB4CHEbjxeajc9r/ZhySyTLsUqOTR019wNVZ2fJdNiE=\n'                     +
      '-----END PRIVATE KEY-----\n',
    pubKey:
      '-----BEGIN PUBLIC KEY-----\n'                                       +
      'MIIDRzCCAjoGByqGSM44BAEwggItAoIBAQDaxITb9+08bVZehMVK0CYIbe7DQVkH\n' +
      'Hjhm663WpKdnQ5zIlx1rfag0gkqKAQ1udQoh3Iy9fs1IpNVE3y/m0mZOUPVT5Wln\n' +
      '6bAqtW6RkH1SEbipzlHvUXEJ2ZeBHugV9jdQCj98KFx21Xy1j6lz4ee081pVrpFd\n' +
      'FpDZeIJGSLck8ZHulVMm6uBpX+tXvdwExOAiserTx4j+h9itoE0gi8RZnnzUhQgo\n' +
      'sVWlSWbZCGGXjr0nLdaifoVMjSpXdsHLS/NCX32PwS1oFZ8bUmhTC22hu+7/w9Uo\n' +
      'TM9A+T/s/2aFj2NyWBUw3Hieu50gecF6DIUPdjHGMRfqQhD+C7+GLJKRAiEA59Ml\n' +
      '4IsGRCRYv1HELhmM2Z709+NSI114yIiExFQ9CnkCggEBANonKP6tfcSdhwrXELWM\n' +
      'pA9LuuA+obgmbWqqb7jRONcXy4BuNaqqB6ZnYhWAx1UJRN5MTPu1IfCT6NPBwb5U\n' +
      '00VLtXG2DnGH4q/zVTk0ZBcMpDLlS2LBfAmfEXRvRTSKBvb3znP1Aor6pejoElQq\n' +
      '1qHynlfDtQgd8zNTBomIIoqdYcIZTmqFIdiF8I02qgGvPHLDTg+Bk88p3XEM6dkD\n' +
      'KPnPPJQyeClvxMOcNwK9RF6NTbeUb6q45RR3a5OFMVbjqw3LWc/PDdZ8G9R3EHwE\n' +
      'cmjlKeIsLVqJP+ZAwv7LB82vxhW3yPdYfuIb+b7W43sUdBz1eDtnDPck8th6LObs\n' +
      '7wEDggEFAAKCAQA1SyQYmrRq2ejIHV1OBDowV6BEiMMTsHEhHSUztH6sx2teshzd\n' +
      'zenUImK1TT9HiHV4YpV/v3J7ouO+t5QoLzy2XPa+Cq+RWwYUP2NseONntAm7aE+g\n' +
      'SvzR3Ckh+lnn2Bj7Jft6BVGPcuwXZbfjc21vZtlgzVWPUZZ1cbp2apvLOiOfeNPQ\n' +
      'FLEqNPfz8z7nDRTTj2yETqs4ZuYq09VKNzTOZcjE+E7FQnka5al9fc6TCJdCLHl6\n' +
      'jIfU5qG25UUEDsqI+einTeLm0m7gwcCnyr2gtqydJ68aaHRnMxIiBauzUM3QvTe1\n' +
      '3Q5agGzkKl0/LFncx/Mi8G4Ia1krRb1zJGj3\n'                             +
      '-----END PUBLIC KEY-----\n',
  },
  {
    algName: "DSA3072",
    priKey:
      '-----BEGIN PRIVATE KEY-----\n'                                      +
      'MIIDXAIBADCCAzUGByqGSM44BAEwggMoAoIBgQC0jyspAkWMN7wf0q7eWhyqU9nm\n' +
      'VrGueHi5sTSgUhxds466LF1dPKm1GWZT9MrosaOpDjgMl8Q/+CRLJtyvRwSwu2vr\n' +
      'L4K0FKPirpq65v0j7SWgkDlEtg4XtAeXZ6e5mZ4YSpik+iQbxCOqxiloeWCch8fd\n' +
      '0/ag7w85Z7W4GGQNa/dVFIsuMzTVt4KbGuQwl/am0Wz2ZxB9nb01Q62YwjsWhruE\n' +
      '0qAhsUODHgsU8mSl9TXVFkNJEX2DXf9nmXB41DrS8TcNgu9Oozvv8mXeds59Ew0l\n' +
      'Dqf4SFLOaTM/RJZIs/wfxXSFk5IVR1K8JgrQiTVa18Ea3VXu4eJEg3SXa2+DqYPz\n' +
      '1CFy4+8u4czt7BolL5bsBwJ3jqjnWMEQeNu72dhdi8wfD8az2L9KE43SpDm4HRQA\n' +
      'uQeuAYxIqYCAhJ4FkIAxpsRVfA7kwgdaqWmvOIrPDEsW2n8+BbP5X1AeFfROQdeP\n' +
      '9VG93LWOyXb+Xo+fIXgom83P6ugLk0/wTPi4o68CHQCoGJeEGV21yvfmodQZDes0\n' +
      'NQ9HUc/hXjDs+23nAoIBgFyG8PDGB9T7L+RST0TL99F2EgwtnEZ1M40A4XgJOJH9\n' +
      '8BZTUWu3YkRjr82Uw1oSam/N8t4/uazRCwDf2g99dmzXQjGRBe6/vFzB6FIAKq2F\n' +
      'gEl/drKH5GG84PsFY0qjzNBvEDMJg+NxJm0WZ5/cJ0hIt2wSofBcHoG4IQx0PSda\n' +
      'wUAmAfypZ1hRIZ8Rrz8JzyNRcyZ8fEIRREAheaEh83KAFUgSFaFyF2487wFCVu17\n' +
      'PwbWlbs0Qg1bB0QiHnlB2MvQivujXXXwmwtbk+/Sogq/uEBQpFwQFkSicKEURtx5\n' +
      '1KkVQj1//UbSqrvsksYso+AWuZjyUXsQCMY8cBPahx7U4sjTSi3N1zYBXpvj6sQq\n' +
      'MF4OLXzjDc4xf0SkQs50t6gp3TtSOikJ7ITTN3VOcde8lsirkFIshOqWyiQzjn4U\n' +
      'B1kn4hYKaR9FUofiARJpEFAXDSRXjjWOyg3aT8bmVkV2tnoLuHeM2eeINiHLYoX7\n' +
      'ljgMVP006HlMuTlZU0cttwQeAhwjTPlaCEbm0evR0VY4wsgU9ei4IGe64p49FxLo\n' +
      '-----END PRIVATE KEY-----\n',
    pubKey:
      '-----BEGIN PUBLIC KEY-----\n'                                       +
      'MIIExjCCAzkGByqGSM44BAEwggMsAoIBgQDD3/6MaU/M7Ks4qUyqDfOleXcqf4k0\n' +
      'lXLn+bcyiFqZva44Nl8BOCowTtMbZk/b5GSMUgcXLAMSbYJVmPJyxKaUVSITJRbD\n' +
      'Avt5kjf68EMyIrQeIa1BJurJuGXVylNL25ehU6BmjHVNco9Dq15XSC8gRbktbRqC\n' +
      'hjnMj7CZb6vCvf7b/sHYqpDFG/dCdSkl/zI51BU3gly6gLupoNZ2yZMnO5wgQ6Vd\n' +
      'Smc0+Hpffw/FdnwWE+n0RGXZY7turrCSZbXKwti3E1F7V4CEA0daoHhRz+kXIRA/\n' +
      'hzIrfrQgu9jhroqK6JXmpdq90iIgxF03/ocMHYbnkWUWHvR9+va7mcu+9xJAmgvZ\n' +
      '3X/1VYj+cWBgmZdSD4n81D9NbidsKoLc2WcHTOnf04GVueEpsttJxOVATncWaUyr\n' +
      'LwutgaLswHn2QRhOyeOvSrxkz4r5pxITjAE08LupkuKHiBfm5xxqgjuTRPjNVu+8\n' +
      '5psq8AcyLue2UdyTuL68t/idFMsgSyecQyECIQD3HXO7h/o8ZZ9mpZaVxNtcG06C\n' +
      'dv6agLvxSQuIsNaR0wKCAYAPDN2Dg9pYVp/lBO/nIqTBz7nPSJWZbpZ2cHG+0uVx\n' +
      'g7ky0j1jgIQHge5asbONFq2Hsu04U0Lu+jXXFNOMqHnbzhIIA5qzgjVpDK93vJBZ\n' +
      'uit6kIAcA/f07Yk20zqr5TVHAqB8XAhB0tCho4Vwljsp1AXy50gcd0jgzB1AAVma\n' +
      '06swRyFqHeJ5OU8HZgmZzlViOkNqS9aqWh/OPGPwY0Y+uq9VvOTY8fGH62EUz8bo\n' +
      'z+wcC5UCDaghyMWwO2nuVmrc6b5Q8+o1P6P4FX7bt2PYOnSfPu8S6m+oSmbEEVki\n' +
      'Oz7fQayvXFB1ddlsCBRFT7ri3BCfOh5HBdi6AQxdw4BJG9e+Hsqc/xfby3ZfujdZ\n' +
      'PuBoe3Hd79LalTDwhD0bz3c5xn3LG0y0uyuBMK2F5Kv0I3BPrsJdOp/EuhvyQDPE\n' +
      'jyCtRumdhLCIsXJGoKcTAqh2hfXF5BkRsPLgo/rHRcL2zIt63sSq2mmWsjPZerNO\n' +
      '1M9VN3uplZw0LsFyQSrYpOsDggGFAAKCAYBc8fqlvEi2SMR97663/SEK2zCl96LT\n' +
      '3MAMuTo5usr5ozymJSV8pT6SbJLMjNtjKJinniHRoDQBeN6L47sTg7qImK5/5bxF\n' +
      'Wzez+BKQY3c69442O8s6j8CzXyPo7OVlrskpOzojCwTUdhxybee42i8NvEUlGwm2\n' +
      'qaT3ibWXycCNdB6v/ypXertnZT2UQkgIXe3jIvhy+qEQ61w34dvU/hu6GSdGY6vM\n' +
      'TZU7lJphWhlh1XJoqSb2klnPvZ2vAD4HtSd1vTZXq+/AnH9g99IeZ1O9ThAt36XL\n' +
      'zmFSkDGT16P4NUuDygTq+4zdbD0fToSnbnsjT4uqh4k4S7nXVrLqX4tMECgAX0Y/\n' +
      'eqQ9EhO45EbGH1Rbb64NqH7uzGyKYDUot/R+Kf//KBYTeXaNgAv/StbekIL2PElf\n' +
      'wXTxeIF7ruX8S0pMwCQ1awf5lgSYuQwmCb+g/++7NDvuIWglQz/xSU3l+4Nithu/\n' +
      'sZwHwjs6pDSAHV79kEqB3A3+g0EV+AEHj2M=\n'                             +
      '-----END PUBLIC KEY-----\n'
  },
  {
    algName: "SM2_256",
    priKey:
    '-----BEGIN SM2 PARAMETERS-----\n'                                   +
      'BggqgRzPVQGCLQ==\n'                                                 +
      '-----END SM2 PARAMETERS-----\n'                                     +
      '-----BEGIN PRIVATE KEY-----\n'                                      +
      'MIGIAgEAMBQGCCqBHM9VAYItBggqgRzPVQGCLQRtMGsCAQEEIG7l+S5R+prpgJXT\n' +
      'ZSOom3boMq8H55myT6T95Jwrf6tVoUQDQgAEmIM+tlBz5e1y3vGW7vw0WZW/15Ab\n' +
      'wmC6T6NBiJbxieOyxOaXxcxIpaS9rkCzgGOwGK+t15WzoB0Kak2IAzfyZQ==\n'     +
      '-----END PRIVATE KEY-----\n',
    pubKey:
    '-----BEGIN PUBLIC KEY-----\n'                                       +
      'MFowFAYIKoEcz1UBgi0GCCqBHM9VAYItA0IABJiDPrZQc+Xtct7xlu78NFmVv9eQ\n' +
      'G8Jguk+jQYiW8YnjssTml8XMSKWkva5As4BjsBivrdeVs6AdCmpNiAM38mU=\n'     +
      '-----END PUBLIC KEY-----\n'
  },
  {
    algName: "X25519",
    priKey:
    '-----BEGIN PRIVATE KEY-----\n'                                      +
      'MC4CAQAwBQYDK2VuBCIEIPh+5Va7DnSrnOz2sB/i3QtrbxCaU3KB5iceDUqwOdRb\n' +
      '-----END PRIVATE KEY-----\n',
    pubKey:
    '-----BEGIN PUBLIC KEY-----\n'                                       +
      'MCowBQYDK2VuAyEAdH3HWDLWDRahg+SNI/NtDMizPgZw1vHnEyksi369SAA=\n'     +
      '-----END PUBLIC KEY-----\n'
  },
  {
    algName: "Ed25519",
    priKey:
      '-----BEGIN PRIVATE KEY-----\n'                                      +
      'MC4CAQAwBQYDK2VwBCIEIIis7xRYQqJMzprTH7swh+cdzb+ZSDcAyno0mWK/HFv9\n' +
      '-----END PRIVATE KEY-----\n',
    pubKey:
      '-----BEGIN PUBLIC KEY-----\n'                                       +
      'MCowBQYDK2VwAyEAmHTqkNJ2cnJf/27gSgGtH2LzUuXpFjxEr2bcA0xAzyM=\n'     +
      '-----END PUBLIC KEY-----\n'
  },
];

let pem_with_pkcs8_not_pkcs8: KeyPairPemString = {
  algName: "ECC256",
  priKey:
    '-----BEGIN EC PRIVATE KEY-----\n'                                   +
    'MHcCAQEEIBC0+PLEtkx7le23i3RI+mhupNLUvjIvd/L1BR9Tr6KqoAoGCCqGSM49\n' +
    'AwEHoUQDQgAEaG+bu2Ior2BLwfmtrMCXwUyT/YRImIhkytuMXz8VBde3gFuMEAko\n' +
    'y84Z8bMW0Z3Vbv6HIGORfRCUc2WYQ1FxBA==\n'                             +
    '-----END EC PRIVATE KEY-----\n'                                     +
    '-----BEGIN PRIVATE KEY-----\n'                                      +
    'MIGHAgEAMBMGByqGSM49AgEGCCqGSM49AwEHBG0wawIBAQQg6GwZ+GSEWijUewRn\n' +
    'aLRhuussHgbsvJiQ0jMRH4nWo0ehRANCAASFVTq+7i9GWSYVXOKvQhZPIuos//e/\n' +
    'FV+ICHivpP/NFIm0OIM5tf3QzQRKsMyY31YlBTKAznHIx6Xfi5vTfVZb\n'         +
    '-----END PRIVATE KEY-----\n',
  pubKey:
  '-----BEGIN PUBLIC KEY-----\n'                                       +
    'MFkwEwYHKoZIzj0CAQYIKoZIzj0DAQcDQgAEhVU6vu4vRlkmFVzir0IWTyLqLP/3\n' +
    'vxVfiAh4r6T/zRSJtDiDObX90M0ESrDMmN9WJQUygM5xyMel34ub031WWw==\n'     +
    '-----END PUBLIC KEY-----\n'
}

let pem_with_dirty_data: KeyPairPemString = {
  algName: "ECC256",
  priKey:
    'pem data test\n'                                                    +
    '-----BEGIN PRIVATE KEY-----\n'                                      +
    'MIGHAgEAMBMGByqGSM49AgEGCCqGSM49AwEHBG0wawIBAQQg6GwZ+GSEWijUewRn\n' +
    'aLRhuussHgbsvJiQ0jMRH4nWo0ehRANCAASFVTq+7i9GWSYVXOKvQhZPIuos//e/\n' +
    'FV+ICHivpP/NFIm0OIM5tf3QzQRKsMyY31YlBTKAznHIx6Xfi5vTfVZb\n'         +
    '-----END PRIVATE KEY-----\n',
  pubKey:
    '-----BEGIN PUBLIC KEY-----\n'                                       +
    'MFkwEwYHKoZIzj0CAQYIKoZIzj0DAQcDQgAEhVU6vu4vRlkmFVzir0IWTyLqLP/3\n' +
    'vxVfiAh4r6T/zRSJtDiDObX90M0ESrDMmN9WJQUygM5xyMel34ub031WWw==\n'     +
    '-----END PUBLIC KEY-----\n'
}

let pkcs12: KeyPairPemString = {
  algName: "SM2_256",
  priKey:
    '-----BEGIN PKCS12-----\n'                                                       +
    'MIIDkgIBAzCCA1gGCSqGSIb3DQEHAaCCA0kEggNFMIIDQTCCAjcGCSqGSIb3DQEHBqCCAigwggIk\n' +
    'AgEAMIICHQYJKoZIhvcNAQcBMBwGCiqGSIb3DQEMAQYwDgQIBpguwAQIfAYCAggAgIIB8DvvCZ3Y\n' +
    '2xNCtFUDNgl84L5HE3K+dLrPrTDNV6QJd61cPeWGm1V4vZQFfSjJge3u3ch2B8cbj8UcPKwm1HW3\n' +
    'pclaQdS8oFDvk3Fi318DGuDmV+fznL0l6Xcrsrh7qCHPNB/mQ64+UPOuLBOKwOGUxvTOYGdrAkPi\n' +
    '6vqfXQMenGPqCR3shnvrHgT8HnxemMhtsAdUl6aRavDJn1tpghhjLWQbSdhnpuoOB/eTTR45jUm9\n' +
    'gKlpIyQ8BJWYN4A0gIz3GoqKtOnFSnARXkQhrnE5VyHErB3Aw05PVkdZfI6A5RZR8ZkHo+MWTejT\n' +
    'MJA5ep60aKZy1696+DIswOrmnZsS6Y/P7C80gZNLfxkR7Z7QXfgQcDnBnsjE1/pv9GAGrtUIcXfV\n' +
    'pFGhgWcQkB7dkIezAC0kzyfuROq3b0nUdNCZ4Mjr/jP9MwMKnL9LE91f7rK8XWUQi8mgn+XnmDN7\n' +
    'gOhEPzRLrtYdDo8Hv6sEPzZ1VT9HoZVI6bDf+9nRlPr0F3CVDuakPn/Ljfr12gInVLhnys79xnpQ\n' +
    'IT+nicfOyR2rnZUIGH6lQCOPN1pS5pF8axCngr6vSjejtEMyUheB3nfNmK5SCYlJE1eCdLz6BXg+\n' +
    'c/ZmY83NiwNcYSjzslCpIpmQpO3uRTME3OUgKqYBj7uM/SowggECBgkqhkiG9w0BBwGggfQEgfEw\n' +
    'ge4wgesGCyqGSIb3DQEMCgECoIG0MIGxMBwGCiqGSIb3DQEMAQMwDgQIojHIG7AWjFACAggABIGQ\n' +
    'k3zHByDoegYZuGr2H/UTQxe4zkoVNykvscTKbJsjOXtlzZb6Fkw8dJHRLKcMoNpoPK9FTmwZyCI9\n' +
    'Gasx5di1qCkc+C99umzM27e2iNSpec3fZTw1eRLagKV6wX8lyVYYJ7ICuNCn0W52bl8gPeE6HZeT\n' +
    '2mMWdFav9gcThh6RHF+iSIGyJqzqNre59BrfT22tMSUwIwYJKoZIhvcNAQkVMRYEFHPpaJTtsPRN\n' +
    '9WqXoYvSWyaMmB3/MDEwITAJBgUrDgMCGgUABBRHPDo+JwyMp1JXz+ZncLuXuOfHwQQI/3cuIf7Z\n' +
    'GhsCAggA\n'                                                                     +
    '-----END PKCS12-----\n',
  pubKey:
    '-----BEGIN PKCS12-----\n'                                                       +
    'LS0tLS1CRUdJTiBQVUJMSUMgS0VZLS0tLS0KTUZrd0V3WUhLb1pJemowQ0FRWUlLb0VjejFVQmdp\n' +
    'MERRZ0FFN0V1emtJOHc0N2ZDaHlBeFpZYys4U3M3OVFXNQowVjR2ZmdGOTBQMFZlelJEKzZienNS\n' +
    'NDVuUFUrUlVnUlNGSTZLOGUxaThNM3JsbUJvbytLRlp1cEZ3PT0KLS0tLS1FTkQgUFVCTElDIEtF\n' +
    'WS0tLS0tCg==\n'                                                                 +
    '-----END PKCS12-----\n'
};

let pkcs7: KeyPairPemString = {
  algName: "SM2_256",
  priKey:
  '-----BEGIN PKCS7-----\n'                                                          +
    'MIIDkgIBAzCCA1gGCSqGSIb3DQEHAaCCA0kEggNFMIIDQTCCAjcGCSqGSIb3DQEHBqCCAigwggIk\n' +
    'AgEAMIICHQYJKoZIhvcNAQcBMBwGCiqGSIb3DQEMAQYwDgQIBpguwAQIfAYCAggAgIIB8DvvCZ3Y\n' +
    '2mMWdFav9gcThh6RHF+iSIGyJqzqNre59BrfT22tMSUwIwYJKoZIhvcNAQkVMRYEFHPpaJTtsPRN\n' +
    '9WqXoYvSWyaMmB3/MDEwITAJBgUrDgMCGgUABBRHPDo+JwyMp1JXz+ZncLuXuOfHwQQI/3cuIf7Z\n' +
    'GhsCAggA\n'                                                                     +
    '-----END PKCS7-----\n',
  pubKey:
  '-----BEGIN PKCS7-----\n'                                                          +
    'LS0tLS1CRUdJTiBQVUJMSUMgS0VZLS0tLS0KTUZrd0V3WUhLb1pJemowQ0FRWUlLb0VjejFVQmdp\n' +
    'MERRZ0FFN0V1emtJOHc0N2ZDaHlBeFpZYys4U3M3OVFXNQowVjR2ZmdGOTBQMFZlelJEKzZienNS\n' +
    'NDVuUFUrUlVnUlNGSTZLOGUxaThNM3JsbUJvbytLRlp1cEZ3PT0KLS0tLS1FTkQgUFVCTElDIEtF\n' +
    'WS0tLS0tCg==\n'                                                                 +
    '-----END PKCS7-----\n'
};

let pkcs12_get_pri_key: KeyPairPemString = {
  algName: "SM2_256",
  priKey:
    'Bag Attributes\n'                                                              +
    '    localKeyID: 73 E9 68 94 ED B0 F4 4D F5 6A 97 A1 8B D2 5B 26 8C 98 1D FF\n' +
    'subject=C = CN, ST = shangxi, L = xian, O = cert, OU = test\n'                 +
    '\n'                                                                            +
    'issuer=C = CN, ST = shangxi, L = xian, O = cert, OU = test\n'                  +
    '\n'                                                                            +
    '-----BEGIN CERTIFICATE-----\n'                                                 +
    'MIIBkjCCATkCFEvN/ifZza4vNGNWIJYgTDd7KEm0MAoGCCqGSM49BAMCMEwxCzAJ\n'            +
    'BgNVBAYTAkNOMRAwDgYDVQQIDAdzaGFuZ3hpMQ0wCwYDVQQHDAR4aWFuMQ0wCwYD\n'            +
    'VQQKDARjZXJ0MQ0wCwYDVQQLDAR0ZXN0MB4XDTI0MDgxMzA5NTYyMVoXDTI0MDkx\n'            +
    'MjA5NTYyMVowTDELMAkGA1UEBhMCQ04xEDAOBgNVBAgMB3NoYW5neGkxDTALBgNV\n'            +
    'BAcMBHhpYW4xDTALBgNVBAoMBGNlcnQxDTALBgNVBAsMBHRlc3QwWTATBgcqhkjO\n'            +
    'PQIBBggqgRzPVQGCLQNCAAQRb95pplI5ETd5ZtkJkEkbGeIAwTSxCh7zVXH0flhk\n'            +
    'rxE1Yv6ICCW5gJsAeFo8KskHXIJ2SnscDLv+7C8O3uBLMAoGCCqGSM49BAMCA0cA\n'            +
    'MEQCIEoHpp39LUf1Rmc79phQg1qlryTwUoGxq3sEyFXvpvwrAiBfzzsoYnifV1UU\n'            +
    'JeJW5qFR+7XnW8X6wNfjLHE/lCdN7Q==\n'                                            +
    '-----END CERTIFICATE-----\n'                                                   +
    'Bag Attributes\n'                                                              +
    '    localKeyID: 73 E9 68 94 ED B0 F4 4D F5 6A 97 A1 8B D2 5B 26 8C 98 1D FF\n' +
    'Key Attributes: <No Attributes>\n'                                             +
    '-----BEGIN PRIVATE KEY-----\n'                                                 +
    'MIGHAgEAMBMGByqGSM49AgEGCCqBHM9VAYItBG0wawIBAQQgrmbM2qtbdW9nm+YK\n'            +
    'W8qrETUBXAm41OqDk/J60WlWKrihRANCAAQRb95pplI5ETd5ZtkJkEkbGeIAwTSx\n'            +
    'Ch7zVXH0flhkrxE1Yv6ICCW5gJsAeFo8KskHXIJ2SnscDLv+7C8O3uBL\n'                    +
    '-----END PRIVATE KEY-----\n',
  pubKey:
    '-----BEGIN PUBLIC KEY-----\n'                                       +
    'MFkwEwYHKoZIzj0CAQYIKoEcz1UBgi0DQgAEEW/eaaZSORE3eWbZCZBJGxniAME0\n' +
    'sQoe81Vx9H5YZK8RNWL+iAgluYCbAHhaPCrJB1yCdkp7HAy7/uwvDt7gSw==\n'     +
    '-----END PUBLIC KEY-----\n'
}

let falsified_pem_tag_with_begin: KeyPairPemString = {
  algName: "ECC521",
  priKey:
    '-----BEGIN ENCRYPTED PRIVATE KEY-----\n'                            +
    'MIIBSzBOBgkqhkiG9w0BBQ0wQTApBgkqhkiG9w0BBQwwHAQIG/UFqcVpvF8CAggA\n' +
    'MAwGCCqGSIb3DQIJBQAwFAYIKoZIhvcNAwcECIcPaSr14No7BIH4+VW84jeDjslg\n' +
    'zkPyrTO77CZsuRqUFKKcrRYOloLKyBuquJEK1lBMy7Vb40ODr48xb8vuI4Cs0Tte\n' +
    'EyBQ9wzLCwpBrwTRAUxaN/+1DUo4rYAKbGYSNFDehYMWgXU1TOf/FJqz3ACoXXhY\n' +
    '2RChoUAgl+ZvcKW8hwJFrwjJ3YLuuXzCiq1LwVfxNALNwLOXwxvWWpTS758cRzNX\n' +
    'f30OfGyUTMQddE/xhbH/G2AyCqjM9nMXW7VKfRM/mg53ldR6xQE9hQ9vomAbzU3j\n' +
    'paGw1xr1ajUmzyBje2X0MgViNs6C9WSgTuI3sLV43ZiG4plsLQXdNUSr4HW1+qY=\n' +
    '-----END PRIVATE KEY-----\n',
  pubKey:
    '-----BEGIN PUBLIC KEY-----\n'                                       +
    'MIGbMBAGByqGSM49AgEGBSuBBAAjA4GGAAQBUdq1y57PVGqNcHp/bwI9qxSSd4d1\n' +
    'YFBYanMbwf+bTNgfR3IXEW+RQym1AU1g3wiEEP1kTJKngZB05sP66vKIlVABw+Uy\n' +
    'W3N8yyp75Q5z2lIrh14kwevqODFaweYPw6nEqqfF0YqnlqrSDHqXo5J4/WRf8inj\n' +
    'wT5f2qvplPD9S4oP920=\n'                                             +
    '-----END PUBLIC KEY-----\n'
};

let falsified_pem_tag_with_all: KeyPairPemString = {
  algName: "ECC521",
  priKey:
    '-----BEGIN PRIVATE KEY-----\n'                                      +
    'MIIBSzBOBgkqhkiG9w0BBQ0wQTApBgkqhkiG9w0BBQwwHAQIG/UFqcVpvF8CAggA\n' +
    'MAwGCCqGSIb3DQIJBQAwFAYIKoZIhvcNAwcECIcPaSr14No7BIH4+VW84jeDjslg\n' +
    'zkPyrTO77CZsuRqUFKKcrRYOloLKyBuquJEK1lBMy7Vb40ODr48xb8vuI4Cs0Tte\n' +
    'EyBQ9wzLCwpBrwTRAUxaN/+1DUo4rYAKbGYSNFDehYMWgXU1TOf/FJqz3ACoXXhY\n' +
    '2RChoUAgl+ZvcKW8hwJFrwjJ3YLuuXzCiq1LwVfxNALNwLOXwxvWWpTS758cRzNX\n' +
    'f30OfGyUTMQddE/xhbH/G2AyCqjM9nMXW7VKfRM/mg53ldR6xQE9hQ9vomAbzU3j\n' +
    'paGw1xr1ajUmzyBje2X0MgViNs6C9WSgTuI3sLV43ZiG4plsLQXdNUSr4HW1+qY=\n' +
    '-----END PRIVATE KEY-----\n',
  pubKey:
    '-----BEGIN PUBLIC KEY-----\n'                                       +
    'MIGbMBAGByqGSM49AgEGBSuBBAAjA4GGAAQBUdq1y57PVGqNcHp/bwI9qxSSd4d1\n' +
    'YFBYanMbwf+bTNgfR3IXEW+RQym1AU1g3wiEEP1kTJKngZB05sP66vKIlVABw+Uy\n' +
    'W3N8yyp75Q5z2lIrh14kwevqODFaweYPw6nEqqfF0YqnlqrSDHqXo5J4/WRf8inj\n' +
    'wT5f2qvplPD9S4oP920=\n'                                             +
    '-----END PUBLIC KEY-----\n'
};

let pri_pub_from_different_keypair: KeyPairPemString = {
  algName: "ECC256",
  priKey:
    '-----BEGIN PRIVATE KEY-----\n'                                      +
    'MIGHAgEAMBMGByqGSM49AgEGCCqGSM49AwEHBG0wawIBAQQgcrhtDoNL2OheOBRn\n' +
    'Ue/POt266AUY5m13yYAagI8vB6WhRANCAATG7oCo5+oVflc7UFfcFQ851J0UqkbN\n' +
    'QsO+QeN/l4ActAm6IJm8r7J9+JqwZeJkFPGEcpHR+I6+obM2dKbatk5y\n'         +
    '-----END PRIVATE KEY-----\n',
  pubKey:
    '-----BEGIN PUBLIC KEY-----\n'                                       +
    'MFkwEwYHKoZIzj0CAQYIKoZIzj0DAQcDQgAEhVU6vu4vRlkmFVzir0IWTyLqLP/3\n' +
    'vxVfiAh4r6T/zRSJtDiDObX90M0ESrDMmN9WJQUygM5xyMel34ub031WWw==\n'     +
    '-----END PUBLIC KEY-----\n'
};

let pri_pub_from_different_algorithm: KeyPairPemString = {
  algName: "ECC256",
  priKey:
    '-----BEGIN PRIVATE KEY-----\n'                                      +
    'MIGHAgEAMBMGByqGSM49AgEGCCqGSM49AwEHBG0wawIBAQQgcrhtDoNL2OheOBRn\n' +
    'Ue/POt266AUY5m13yYAagI8vB6WhRANCAATG7oCo5+oVflc7UFfcFQ851J0UqkbN\n' +
    'QsO+QeN/l4ActAm6IJm8r7J9+JqwZeJkFPGEcpHR+I6+obM2dKbatk5y\n'         +
    '-----END PRIVATE KEY-----\n',
  pubKey:
    '-----BEGIN PUBLIC KEY-----\n'                                       +
    'MFkwEwYHKoZIzj0CAQYIKoEcz1UBgi0DQgAEEW/eaaZSORE3eWbZCZBJGxniAME0\n' +
    'sQoe81Vx9H5YZK8RNWL+iAgluYCbAHhaPCrJB1yCdkp7HAy7/uwvDt7gSw==\n'     +
    '-----END PUBLIC KEY-----\n'                                         +
    '-----BEGIN PUBLIC KEY-----\n'                                       +
    'MFkwEwYHKoZIzj0CAQYIKoZIzj0DAQcDQgAExu6AqOfqFX5XO1BX3BUPOdSdFKpG\n' +
    'zULDvkHjf5eAHLQJuiCZvK+yffiasGXiZBTxhHKR0fiOvqGzNnSm2rZOcg==\n'     +
    '-----END PUBLIC KEY-----\n'
};

let sm2_falsified_object_one: KeyPairPemString = {
  algName: "SM2_256",
  priKey:
    '-----BEGIN PRIVATE KEY-----\n'                                      +
    'MIGIAgEAMBQGCCqBHM9VAYItBggqgRzPVQGCLQRtMGsCAQEEIK5mzNqrW3VvZ5vm\n' +
    'ClvKqxE1AVwJuNTqg5PyetFpViq4oUQDQgAEEW/eaaZSORE3eWbZCZBJGxniAME0\n' +
    'sQoe81Vx9H5YZK8RNWL+iAgluYCbAHhaPCrJB1yCdkp7HAy7/uwvDt7gSw==\n'     +
    '-----END PRIVATE KEY-----\n',
  pubKey:
    '-----BEGIN PUBLIC KEY-----\n'                                       +
    'MFkwEwYHKoZIzj0CAQYIKoEcz1UBgi0DQgAEEW/eaaZSORE3eWbZCZBJGxniAME0\n' +
    'sQoe81Vx9H5YZK8RNWL+iAgluYCbAHhaPCrJB1yCdkp7HAy7/uwvDt7gSw==\n'     +
    '-----END PUBLIC KEY-----\n'
};

let sm2_falsified_object_two: KeyPairPemString = {
  algName: "SM2_256",
  priKey:
    '-----BEGIN PRIVATE KEY-----\n'                                      +
    'MIGHAgEAMBMGCCqBHM9VAYItBgcqhkjOPQIBBG0wawIBAQQgrmbM2qtbdW9nm+YK\n' +
    'W8qrETUBXAm41OqDk/J60WlWKrihRANCAAQRb95pplI5ETd5ZtkJkEkbGeIAwTSx\n' +
    'Ch7zVXH0flhkrxE1Yv6ICCW5gJsAeFo8KskHXIJ2SnscDLv+7C8O3uBL\n'         +
    '-----END PRIVATE KEY-----\n',
  pubKey:
  '-----BEGIN PUBLIC KEY-----\n'                                       +
    'MFkwEwYHKoZIzj0CAQYIKoEcz1UBgi0DQgAEEW/eaaZSORE3eWbZCZBJGxniAME0\n' +
    'sQoe81Vx9H5YZK8RNWL+iAgluYCbAHhaPCrJB1yCdkp7HAy7/uwvDt7gSw==\n'     +
    '-----END PUBLIC KEY-----\n'
};

let dh_falsified_data_type: KeyPairPemString = {
  algName: "DH_modp1536",
  priKey:
    '-----BEGIN PRIVATE KEY-----\n'                                      +
    'MIIBWwIBADCCATQGByqGSM49AgEwggEnAoGBAKszTLEFGoGi6T/u+FnoHZqOKR/a\n' +
    'Tm1ADs0XsEKGFrMrups3zVouveK9lqLhkAnRji80u0RXkqz9STk3hEAh935WHnmC\n' +
    'ldKY3a/X8rw6c8BFq9O3ZaoLoPEK2vw02VIuwi9QOLpdPI0PcKRTZRwLH0HYme6m\n' +
    'UzpAwnd7Vl9DkWwRAh0A3uCKW85t431mK4A3tXL7A0iAdiBVD0Tw6wmfgwKBgQCk\n' +
    'Koi4pP3K1wEwLFqbMyg2KJ9lthP1GsnGftTilf1uYmR0YEXkIw18liXXLFITf5Kf\n' +
    'IbcrUtF7DqYXUol0WD7yLjCbuF46m/U7PcaNXfh21GJS1l7rl17AOuM3aJ9xr3FC\n' +
    'xtBPwCTiCYlVkpOYCy1cqGn8+ghWBtAVGEcjzyusWwQeAhxmySg7uETSAJwbG8X4\n' +
    'cw7ub6PfhYgJfrKEI3Yw\n'                                             +
    '-----END PRIVATE KEY-----\n',
  pubKey:
    '-----BEGIN PUBLIC KEY-----\n'                                       +
    'MIIBoDCB1QYJKoZIhvcNAQMBMIHHAoHBAP//////////yQ/aoiFowjTExmKLgNwc\n' +
    '0SkCTgiKZ8x0Agu+pjsTmyJRSgh5jjQE3e+VGbPNOkMbMCsKbfJfFDdP4TVtbVHC\n' +
    'ReSFtXZiXn7G9ExC6aY37WsL/1y29Aa37e44a/taiZ+lrp8kEXxLH+ZJKGZR7ORb\n' +
    'PcIAfLihY78FmNpINhxV05ppFj+o/STPX4NlXSPco62WHGLzViCFUrue1SkHcJaW\n' +
    'bWcMNU5KvJgE8XRsCMojcyf//////////wIBAgOBxQACgcEArUh5hi507LdnGfXb\n' +
    'i3/IRC2rM2DfPRyIp5uzdZ/SQEL5Nzwc5pPmHXEdAccMMtaFk/v7TfO+EYtFYxuU\n' +
    'anZnbqWiPnJIxErlA7mWihadiEDWfkxP/fUzNFium82IypvT+KqbdFIvJ9ihJ/Uu\n' +
    'IWK8aKn0ZrXJRvvhg5F+sq+SZ/NCv1eoAjBaoOl3WNrA6YD+TRIlXoKI22Joc+qd\n' +
    'RarZ1K/kYfaWCRCDLlzFmYSLrqB2T5vdzmBAxLa1GN0lqX/0\n'                 +
    '-----END PUBLIC KEY-----\n'
};

let dsa1024_falsified_object: KeyPairPemString = {
  algName: "DSA1024",
  priKey:
    '-----BEGIN PRIVATE KEY-----\n'                                      +
    'MIIBWwIBADCCATQGByqGSM49AgEwggEnAoGBAKszTLEFGoGi6T/u+FnoHZqOKR/a\n' +
    'Tm1ADs0XsEKGFrMrups3zVouveK9lqLhkAnRji80u0RXkqz9STk3hEAh935WHnmC\n' +
    'ldKY3a/X8rw6c8BFq9O3ZaoLoPEK2vw02VIuwi9QOLpdPI0PcKRTZRwLH0HYme6m\n' +
    'UzpAwnd7Vl9DkWwRAh0A3uCKW85t431mK4A3tXL7A0iAdiBVD0Tw6wmfgwKBgQCk\n' +
    'Koi4pP3K1wEwLFqbMyg2KJ9lthP1GsnGftTilf1uYmR0YEXkIw18liXXLFITf5Kf\n' +
    'IbcrUtF7DqYXUol0WD7yLjCbuF46m/U7PcaNXfh21GJS1l7rl17AOuM3aJ9xr3FC\n' +
    'xtBPwCTiCYlVkpOYCy1cqGn8+ghWBtAVGEcjzyusWwQeAhxmySg7uETSAJwbG8X4\n' +
    'cw7ub6PfhYgJfrKEI3Yw\n'                                             +
    '-----END PRIVATE KEY-----\n',
  pubKey:
  '-----BEGIN PUBLIC KEY-----\n'                                       +
    'MIIBtzCCASsGByqGSM44BAEwggEeAoGBANdaKLgz0spoF+aH4HbSRWaTlgOod2Og\n' +
    'uqquAQg9jTfXxqhO9vRiIOG2srl+zUEDuWUROKj6qiJ3o4U/TZhR6C4NGckIh+G4\n' +
    'fzFj4Ga1TlPr+3bIDuUJD5/5k8Je4tpxRPai1koce6DZrY4zmM22IdLGl5Uwh1eX\n' +
    'CgpoXI8A0CCXAhUAjJCO/9KIgEhDLIcqoOLoL11Md/UCgYABIf5VzvpImxjt0bUi\n' +
    '+PrEt/DAUDfA1ifF5xtEqOJEfdRPmeuZS4Q213ttGWkwggWsBK9wD6DA94dKLXvQ\n' +
    '4vtIDVq0RzsIVh/dOMhxqtSNwffUbeTU3+VVCEoPJyjrM/Sv1KI9BZmawy3MdSFj\n' +
    'ld+Sgi8JBKvwlOpA42wXpruozQOBhQACgYEA1DWLVJBjEUGMJqj13QnPkMgImeNy\n' +
    'jcOH66R5ZnOv4vWsCh0QxaEVmC0HNNria+PABGC98ILSYZKZ7H3ZSWivEuwVqZ6s\n' +
    'RdHWydM24wv92bxqOKiyAp/UE8JjkWYMlU68XeHnG22V6qeWdui5+3mJSs99LYaB\n' +
    'fmPc8qKx9W/F/6g=\n'                                                 +
    '-----END PUBLIC KEY-----\n'
};

let brainpool_p160r1: KeyPairPemString = {
  algName: "ECC_BrainPoolP160r1",
  priKey:
    '-----BEGIN PRIVATE KEY-----\n'                                      +
    'MGQCAQAwFAYHKoZIzj0CAQYJKyQDAwIIAQEBBEkwRwIBAQQUO4Uv6i1/166XaFpC\n' +
    'oYWlircP3ImhLAMqAARfVLzoXoRNDsxU9NiuteEm0/8gZtQx81C5GzX3PmAd0Gg8\n' +
    'XM/1FJGi\n'                                                         +
    '-----END PRIVATE KEY-----\n',
  pubKey:
    '-----BEGIN PUBLIC KEY-----\n'                                       +
    'MEIwFAYHKoZIzj0CAQYJKyQDAwIIAQEBAyoABF9UvOhehE0OzFT02K614SbT/yBm\n' +
    '1DHzULkbNfc+YB3QaDxcz/UUkaI=\n'                                     +
    '-----END PUBLIC KEY-----\n'                                         +
    '-----BEGIN CERTIFICATE-----\n'                                      +
    'MIIBxTCCAYSgAwIBAgIUBryRePUcip2ta8SLpTy/+DvWv0kwCgYIKoZIzj0EAwIw\n' +
    'UDELMAkGA1UEBhMCQ04xEDAOBgNVBAgMB3NoYW5neGkxDTALBgNVBAcMBHhpYW4x\n' +
    'DTALBgNVBAoMBHRlc3QxETAPBgNVBAMMCGNlcnR0ZXN0MB4XDTI0MDgxMjEzMjg1\n' +
    'OFoXDTI0MDkxMTEzMjg1OFowUDELMAkGA1UEBhMCQ04xEDAOBgNVBAgMB3NoYW5n\n' +
    'eGkxDTALBgNVBAcMBHhpYW4xDTALBgNVBAoMBHRlc3QxETAPBgNVBAMMCGNlcnR0\n' +
    'ZXN0MEIwFAYHKoZIzj0CAQYJKyQDAwIIAQEBAyoABF9UvOhehE0OzFT02K614SbT\n' +
    '/yBm1DHzULkbNfc+YB3QaDxcz/UUkaKjUzBRMB0GA1UdDgQWBBROHfnHGPsrwKwM\n' +
    'Lk6PLWCc+/e9rzAfBgNVHSMEGDAWgBROHfnHGPsrwKwMLk6PLWCc+/e9rzAPBgNV\n' +
    'HRMBAf8EBTADAQH/MAoGCCqGSM49BAMCAy8AMCwCFFg1SSDW5Q9J1oL7WbwhzJQr\n' +
    'Z4ddAhRSl6X0KsOUeESydO7GP1H9ek8ZKA==\n'                             +
    '-----END CERTIFICATE-----\n'
};

let ecc384_falsified_prime: KeyPairPemString = {
  algName: "ECC384",
  priKey:
    '-----BEGIN PRIVATE KEY-----\n'                                      +
    'MIG2AgEAMBAGByqGSM49AgEGBSuBBAAiBIGeMIGbAgEBBDAuhlbkTq2SMs113MeQ\n' +
    'rzYFnZh35dfSwJp2SbkFwnb2eRlTU3ms/lG00FlkbrEzf1uhZANiAARVWcQCTSqw\n' +
    'oeGKLfTbXbcA8Czf4kPYxzBkdC/gAU9w8P2pAr4hlQq3NHu7Tin1eYgYC92bZpQp\n' +
    'Dmmn7mLZF5AoVnpfVGArclsqXRYk8w+XFR1sduuL31p5j7X3Jmf4Xq4=\n'         +
    '-----END PRIVATE KEY-----\n',
  pubKey:
    '-----BEGIN PUBLIC KEY-----\n'                                       +
    'MHYwEAYHKoZIzj0CAQYFK4EEACIDYgAEVVnEAk0qsKHhii302123APAs3+JD2Mcw\n' +
    'ZHQv4AFPcPD9qQK+IZUKtzR7u04p9XmIGAvdm2aUKQ5pp+5i2ReQKFZ6X1RgK3Jb\n' +
    'Kl0WJPMPlxUdbHbri99aeY+19yZn+F6u\n'                                 +
    '-----END PUBLIC KEY-----\n'
};

let ecc384_pri_del_prime: KeyPairPemString = {
  algName: "ECC384",
  priKey:
    '-----BEGIN EC PRIVATE KEY-----\n'                                   +
    'MIGEAgEAMBAGByqGSM49AgEGBSuBBAAiBG0wawIBAQQAoWQDYgAEVVnEAk0qsKHh\n' +
    'ii302123APAs3+JD2McwZHQv4AFPcPD9qQK+IZUKtzR7u04p9XmIGAvdm2aUKQ5p\n' +
    'p+5i2ReQKFZ6X1RgK3JbKl0WJPMPlxUdbHbri99aeY+19yZn+F6u\n'             +
    '-----END EC PRIVATE KEY-----\n',
  pubKey:
    '-----BEGIN PUBLIC KEY-----\n'                                       +
    'MHYwEAYHKoZIzj0CAQYFK4EEACIDYgAEVVnEAk0qsKHhii302123APAs3+JD2Mcw\n' +
    'ZHQv4AFPcPD9qQK+IZUKtzR7u04p9XmIGAvdm2aUKQ5pp+5i2ReQKFZ6X1RgK3Jb\n' +
    'Kl0WJPMPlxUdbHbri99aeY+19yZn+F6u\n'                                 +
    '-----END PUBLIC KEY-----\n'
};

let ecc384_falsified_curve_name: KeyPairPemString = {
  algName: "ECC384",
  priKey:
    '-----BEGIN EC PRIVATE KEY-----\n'                                   +
    'MIGkAgEBBDCG0c6AAMCuDCzZ+XfzNu1xqOHD7w+Tw+sw2cuspTdwr20vEruXZ5qH\n' +
    'HBtH7AvWGy6gBwYFK4EEACOhZANiAASG+5FYQl3DyubLtVGxOG6VphBF9YJsQ7m/\n' +
    'zNe40Er4AaVcPiOJZ1kRUFkXmAkUYYaGMAARa0x0KNu+s6jWvL/LY4uF0RzDqIm/\n' +
    'iek5A+qjuBAK9jfBmNVRqT489RN7w0Y=\n'                                 +
    '-----END EC PRIVATE KEY-----\n',
  pubKey:
    '-----BEGIN PUBLIC KEY-----\n'                                       +
    'MHYwEAYHKoZIzj0CAQYFK4EEACIDYgAEhvuRWEJdw8rmy7VRsThulaYQRfWCbEO5\n' +
    'v8zXuNBK+AGlXD4jiWdZEVBZF5gJFGGGhjAAEWtMdCjbvrOo1ry/y2OLhdEcw6iJ\n' +
    'v4npOQPqo7gQCvY3wZjVUak+PPUTe8NG\n'                                 +
    '-----END PUBLIC KEY-----\n'
};

let ecc224_enc_des3_123456_pri_key: KeyPairPemString = {
  algName: "ECC224",
  pubKey:
    '-----BEGIN PUBLIC KEY-----\n'                                       +
    'ME4wEAYHKoZIzj0CAQYFK4EEACEDOgAEouUVBekrY3pF1eA2eebX2Djg3TI4U14q\n' +
    'D0T1o7hRtcxZX/XjKZfllXvnNoPhjeLSuvabT8lu4JQ=\n'                     +
    '-----END PUBLIC KEY-----\n',
  priKey:
    '-----BEGIN ENCRYPTED PRIVATE KEY-----\n'                            +
    'MIHTME4GCSqGSIb3DQEFDTBBMCkGCSqGSIb3DQEFDDAcBAhO7yJKPrbn7QICCAAw\n' +
    'DAYIKoZIhvcNAgkFADAUBggqhkiG9w0DBwQIaxLjd7//EaUEgYB6Xbsu1kJpCJPI\n' +
    'rnLBl4xjbNb3dyUQODZTjaXusibibu/epb7m1F7U/+4DshTR+T7ri7I95TDas7dx\n' +
    'zISrqHYyjwBCIeApZeP3xTBFpQyH7gCpLudtieOdeVn6zC4LWdkHPspCxMR5AqXo\n' +
    'IQKd4MBUULZjxXv4aq2wXOGHufXXAw==\n'                                 +
    '-----END ENCRYPTED PRIVATE KEY-----\n'
};

let modp1536_pub_not_pem_head: KeyPairPemString = {
  algName: "DH_modp1536",
  priKey:
    '-----BEGIN PRIVATE KEY-----\n'                                      +
    'MIH4AgEAMIHVBgkqhkiG9w0BAwEwgccCgcEA///////////JD9qiIWjCNMTGYouA\n' +
    '3BzRKQJOCIpnzHQCC76mOxObIlFKCHmONATd75UZs806QxswKwpt8l8UN0/hNW1t\n' +
    'UcJF5IW1dmJefsb0TELppjftawv/XLb0Brft7jhr+1qJn6WunyQRfEsf5kkoZlHs\n' +
    '5Fs9wgB8uKFjvwWY2kg2HFXTmmkWP6j9JM9fg2VdI9yjrZYcYvNWIIVSu57VKQdw\n' +
    'lpZtZww1Tkq8mATxdGwIyiNzJ///////////AgECBBsCGR6F9KWkU6w0tfMsUxuw\n' +
    'cT19GZv2khb+qfk=\n'                                                 +
    '-----END PRIVATE KEY-----\n',
  pubKey:
    'MIIBoDCB1QYJKoZIhvcNAQMBMIHHAoHBAP//////////yQ/aoiFowjTExmKLgNwc\n' +
    '0SkCTgiKZ8x0Agu+pjsTmyJRSgh5jjQE3e+VGbPNOkMbMCsKbfJfFDdP4TVtbVHC\n' +
    'ReSFtXZiXn7G9ExC6aY37WsL/1y29Aa37e44a/taiZ+lrp8kEXxLH+ZJKGZR7ORb\n' +
    'PcIAfLihY78FmNpINhxV05ppFj+o/STPX4NlXSPco62WHGLzViCFUrue1SkHcJaW\n' +
    'bWcMNU5KvJgE8XRsCMojcyf//////////wIBAgOBxQACgcEArUh5hi507LdnGfXb\n' +
    'i3/IRC2rM2DfPRyIp5uzdZ/SQEL5Nzwc5pPmHXEdAccMMtaFk/v7TfO+EYtFYxuU\n' +
    'anZnbqWiPnJIxErlA7mWihadiEDWfkxP/fUzNFium82IypvT+KqbdFIvJ9ihJ/Uu\n' +
    'IWK8aKn0ZrXJRvvhg5F+sq+SZ/NCv1eoAjBaoOl3WNrA6YD+TRIlXoKI22Joc+qd\n' +
    'RarZ1K/kYfaWCRCDLlzFmYSLrqB2T5vdzmBAxLa1GN0lqX/0\n'                 +
    '-----END PUBLIC KEY-----\n'
};

let modp1536_pri_not_pem_tail: KeyPairPemString = {
  algName: "DH_modp1536",
  priKey:
  '-----BEGIN PRIVATE KEY-----\n'                                      +
    'MIH4AgEAMIHVBgkqhkiG9w0BAwEwgccCgcEA///////////JD9qiIWjCNMTGYouA\n' +
    '3BzRKQJOCIpnzHQCC76mOxObIlFKCHmONATd75UZs806QxswKwpt8l8UN0/hNW1t\n' +
    'UcJF5IW1dmJefsb0TELppjftawv/XLb0Brft7jhr+1qJn6WunyQRfEsf5kkoZlHs\n' +
    '5Fs9wgB8uKFjvwWY2kg2HFXTmmkWP6j9JM9fg2VdI9yjrZYcYvNWIIVSu57VKQdw\n' +
    'lpZtZww1Tkq8mATxdGwIyiNzJ///////////AgECBBsCGR6F9KWkU6w0tfMsUxuw\n' +
    'cT19GZv2khb+qfk=\n',
  pubKey:
    '-----BEGIN PUBLIC KEY-----\n'                                       +
    'MIIBoDCB1QYJKoZIhvcNAQMBMIHHAoHBAP//////////yQ/aoiFowjTExmKLgNwc\n' +
    '0SkCTgiKZ8x0Agu+pjsTmyJRSgh5jjQE3e+VGbPNOkMbMCsKbfJfFDdP4TVtbVHC\n' +
    'ReSFtXZiXn7G9ExC6aY37WsL/1y29Aa37e44a/taiZ+lrp8kEXxLH+ZJKGZR7ORb\n' +
    'PcIAfLihY78FmNpINhxV05ppFj+o/STPX4NlXSPco62WHGLzViCFUrue1SkHcJaW\n' +
    'bWcMNU5KvJgE8XRsCMojcyf//////////wIBAgOBxQACgcEArUh5hi507LdnGfXb\n' +
    'i3/IRC2rM2DfPRyIp5uzdZ/SQEL5Nzwc5pPmHXEdAccMMtaFk/v7TfO+EYtFYxuU\n' +
    'anZnbqWiPnJIxErlA7mWihadiEDWfkxP/fUzNFium82IypvT+KqbdFIvJ9ihJ/Uu\n' +
    'IWK8aKn0ZrXJRvvhg5F+sq+SZ/NCv1eoAjBaoOl3WNrA6YD+TRIlXoKI22Joc+qd\n' +
    'RarZ1K/kYfaWCRCDLlzFmYSLrqB2T5vdzmBAxLa1GN0lqX/0\n'                 +
    '-----END PUBLIC KEY-----\n'
};

let ed25519_pub_not_satisfied_base64: KeyPairPemString = {
  algName: "Ed25519",
  priKey:
    '-----BEGIN PRIVATE KEY-----\n'                                      +
    'MC4CAQAwBQYDK2VwBCIEIIis7xRYQqJMzprTH7swh+cdzb+ZSDcAyno0mWK/HFv9\n' +
    '-----END PRIVATE KEY-----\n',
  pubKey:
    '-----BEGIN PUBLIC KEY-----\n'                                       +
    'MCowBQYDK2VwAyEAmHTqkNJ2cnJf/27gSgGtH2LzUuXpFjxEr2bcA0xAzyM==\n'    +
    '-----END PUBLIC KEY-----\n'
};

let ed25519_pri_not_satisfied_base64: KeyPairPemString = {
  algName: "Ed25519",
  priKey:
    '-----BEGIN PRIVATE KEY-----\n'                                      +
    'MC4CAQAwBQYDK2VwBCIEIIis7xRYQqJMzprTH7swh+cdzb+ZSDcAyno0mWK/HFv=\n' +
    '-----END PRIVATE KEY-----\n',
  pubKey:
    '-----BEGIN PUBLIC KEY-----\n'                                       +
    'MCowBQYDK2VwAyEAmHTqkNJ2cnJf/27gSgGtH2LzUuXpFjxEr2bcA0xAzyM=\n'     +
    '-----END PUBLIC KEY-----\n'
};

let x25519_falsified: KeyPairPemString = {
  algName: "X25519",
  priKey:
    '-----BEGIN PRIVATE KEY-----\n'                                      +
    'MC4CAQAwBQYDK2VuBCIEIPh+5Va7DnSrnOz2sB/i3QtrbxCaU3KB5iceDUqwOdRb\n' +
    '-----END PRIVATE KEY-----\n',
  pubKey:
    '-----BEGIN PUBLIC KEY-----\n'                                       +
    'MCowBQYDK2VuAyEAdH3HWDLWDRahg+SNI/NtDMizPgZw1vHnEyksi369SAA=\n'     +
    '-----END  PUBLIC KEY-----\n'
};

let ecc521_falsified: KeyPairPemString = {
  algName: "ECC521",
  pubKey:
    '------BEGIN PUBLIC KEY-----\n'                                      +
    'MIGbMBAGByqGSM49AgEGBSuBBAAjA4GGAAQAy9lvdRUCOA8FiJ6hYJY/MFytQbNv\n' +
    'M6Qu1K7lrp4vf1ZBb3tgMw9KVDNCHJJqp4t1VgmYYgqBKc5qB8EmytBwD3UBqDVa\n' +
    'MyZK7gAb4tIL//UaQ9dUKbb3/973tiQ79akdpkAEkduR8MPz7DLSclksog0tFVri\n' +
    'wyq+zQB9OVYCfe23a+c=\n'                                             +
    '-----END PUBLIC KEY-----\n',
  priKey:
    '-----BEGIN EC PRIVATE KEY-----\n'                                   +
    'MIHcAgEBBEIA0pA8cBLpaVTTXZh20viePfAJLKnK0JYBnqUb5EKk/u5vPclNsHx8\n' +
    'sk+bh+RSmkfW1flOuzpFrD1DJ3Om31vcN3GgBwYFK4EEACOhgYkDgYYABADL2W91\n' +
    'FQI4DwWInqFglj8wXK1Bs28zpC7UruWuni9/VkFve2AzD0pUM0Ickmqni3VWCZhi\n' +
    'CoEpzmoHwSbK0HAPdQGoNVozJkruABvi0gv/9RpD11Qptvf/3ve2JDv1qR2mQASR\n' +
    '25Hww/PsMtJyWSyiDS0VWuLDKr7NAH05VgJ97bdr5w==\n'                     +
    '-----END EC PRIVATE KEY-----\n'
};

let ecc521: KeyPairPemString = {
  algName: "ECC521",
  pubKey:
    '-----BEGIN PUBLIC KEY-----\n'                                       +
    'MIGbMBAGByqGSM49AgEGBSuBBAAjA4GGAAQAy9lvdRUCOA8FiJ6hYJY/MFytQbNv\n' +
    'M6Qu1K7lrp4vf1ZBb3tgMw9KVDNCHJJqp4t1VgmYYgqBKc5qB8EmytBwD3UBqDVa\n' +
    'MyZK7gAb4tIL//UaQ9dUKbb3/973tiQ79akdpkAEkduR8MPz7DLSclksog0tFVri\n' +
    'wyq+zQB9OVYCfe23a+c=\n'                                             +
    '-----END PUBLIC KEY-----\n',
  priKey:
    '-----BEGIN EC PRIVATE KEY-----\n'                                   +
    'MIHcAgEBBEIA0pA8cBLpaVTTXZh20viePfAJLKnK0JYBnqUb5EKk/u5vPclNsHx8\n' +
    'sk+bh+RSmkfW1flOuzpFrD1DJ3Om31vcN3GgBwYFK4EEACOhgYkDgYYABADL2W91\n' +
    'FQI4DwWInqFglj8wXK1Bs28zpC7UruWuni9/VkFve2AzD0pUM0Ickmqni3VWCZhi\n' +
    'CoEpzmoHwSbK0HAPdQGoNVozJkruABvi0gv/9RpD11Qptvf/3ve2JDv1qR2mQASR\n' +
    '25Hww/PsMtJyWSyiDS0VWuLDKr7NAH05VgJ97bdr5w==\n'                     +
    '-----END EC PRIVATE KEY-----\n'
};

let dsa1024: KeyPairPemString = {
  algName: "DSA1024",
  pubKey:
    '-----BEGIN PUBLIC KEY-----\n'                                       +
    'MIIBtjCCASsGByqGSM44BAEwggEeAoGBAJnBswub5rYd3hTdBo9w9INQutGBIZYM\n' +
    'f+Ec57AKUbZvew/8cPp3vXdwwWnA0BZRNpwC4v1To83dNBHuhbwjHJXqIm43go3u\n' +
    'J2WNCV8E0vFk41a029v22BWbuVzh4ryUsK2re8hbR0iEk2ToNyWhbVEVF3vgmEbG\n' +
    'heIJEObPX69nAhUAsljW+tDJ4+RgOQxDEGb/gAyc6psCgYBmZ1bABrQ8FvrrEZkR\n' +
    '8ahh/OttnZlkHfgIGO90pPwr7r5d9hsoJ1wosab4dv4NpZPyKyG+JZm+y+7KzsG8\n' +
    '9NicnieKSaeDXuI0DR/gkPZ5tLRxwOxy59jC8unKh45/T4TbSeNNIpQl0aw5Se2G\n' +
    'i5ovTTstv6UzlaUCDr2ilXpqdgOBhAACgYA0dPVbiVqaoCTxb6xV+PEPYX3zaVAy\n' +
    'MHhHiqXyLlkaL7aIZE4bod8obyL+R5rwN+RShkc7e92ct2OU0l0FpCNGsg5UOa98\n' +
    'VsI/WZtg0Q7eOWJVk1/NSa6WPgScbaxvY1vFyYkQvRpLnHwc5ZAVc8MeZwDICXl5\n' +
    'CmpP+I55dw7uHg==\n'                                                 +
    '-----END PUBLIC KEY-----\n',
  priKey:
    '-----BEGIN DSA PRIVATE KEY-----\n'                                  +
    'MIIBuwIBAAKBgQCZwbMLm+a2Hd4U3QaPcPSDULrRgSGWDH/hHOewClG2b3sP/HD6\n' +
    'd713cMFpwNAWUTacAuL9U6PN3TQR7oW8IxyV6iJuN4KN7idljQlfBNLxZONWtNvb\n' +
    '9tgVm7lc4eK8lLCtq3vIW0dIhJNk6DcloW1RFRd74JhGxoXiCRDmz1+vZwIVALJY\n' +
    '1vrQyePkYDkMQxBm/4AMnOqbAoGAZmdWwAa0PBb66xGZEfGoYfzrbZ2ZZB34CBjv\n' +
    'dKT8K+6+XfYbKCdcKLGm+Hb+DaWT8ishviWZvsvuys7BvPTYnJ4nikmng17iNA0f\n' +
    '4JD2ebS0ccDscufYwvLpyoeOf0+E20njTSKUJdGsOUnthouaL007Lb+lM5WlAg69\n' +
    'opV6anYCgYA0dPVbiVqaoCTxb6xV+PEPYX3zaVAyMHhHiqXyLlkaL7aIZE4bod8o\n' +
    'byL+R5rwN+RShkc7e92ct2OU0l0FpCNGsg5UOa98VsI/WZtg0Q7eOWJVk1/NSa6W\n' +
    'PgScbaxvY1vFyYkQvRpLnHwc5ZAVc8MeZwDICXl5CmpP+I55dw7uHgIVAIk9RaqO\n' +
    'sfZqBFnwIvroYiWDXrii\n'                                             +
    '-----END DSA PRIVATE KEY-----\n'
};

let dh: KeyPairPemString[] = [
  {
    algName: "DH_ffdhe2048",
    priKey:
      '-----BEGIN PRIVATE KEY-----\n'                                      +
      'MIIBPgIBADCCARcGCSqGSIb3DQEDATCCAQgCggEBAP//////////rfhUWKK7Spqv\n' +
      '3FYgJz088di5xYPOLTaVqeE2QRRkM/vMk53OJJs++X0v42NjDHXY9oGyAq7EYXrT\n' +
      '3x7V1f1lYSQz9R9fBm7QhWNlVT3tGvO1VxNef1fJNZhPDHDg5ot34qaJ2vPv6HId\n' +
      '8VihNq3nNTCsyk9IOnl6vAqxgrMk+2HRCKlLssjj+7lq2rdg1/RoHU9Co945TfSu\n' +
      'Vu3nY3K7GQsHp8juCm1wngL84c334uzANATNKDQvYZFy/pzphYP/jk8SMu7ygYPD\n' +
      '/jsbTG+tczu1/LwuwiAFxY7xg30Wg7LG80omwbLv+ohrQjhhKFyX//////////8C\n' +
      'AQIEHgIcGKtpBSJ6ynrM2Rg7qkDdW7X+m++asD+6SC802w==\n'                 +
      '-----END PRIVATE KEY-----\n',
    pubKey:
      '-----BEGIN PUBLIC KEY-----\n'                                       +
      'MIICJDCCARcGCSqGSIb3DQEDATCCAQgCggEBAP//////////rfhUWKK7Spqv3FYg\n' +
      'Jz088di5xYPOLTaVqeE2QRRkM/vMk53OJJs++X0v42NjDHXY9oGyAq7EYXrT3x7V\n' +
      '1f1lYSQz9R9fBm7QhWNlVT3tGvO1VxNef1fJNZhPDHDg5ot34qaJ2vPv6HId8Vih\n' +
      'Nq3nNTCsyk9IOnl6vAqxgrMk+2HRCKlLssjj+7lq2rdg1/RoHU9Co945TfSuVu3n\n' +
      'Y3K7GQsHp8juCm1wngL84c334uzANATNKDQvYZFy/pzphYP/jk8SMu7ygYPD/jsb\n' +
      'TG+tczu1/LwuwiAFxY7xg30Wg7LG80omwbLv+ohrQjhhKFyX//////////8CAQID\n' +
      'ggEFAAKCAQA1G0jXzEUud84JTEYQR1so10cHHY6t4lGVBhDCrxAlxrGS1egcVOW7\n' +
      'y0fb2w10d7Bd33lV93NUFOrEs7d8MOuDJMnlU0reWAhEKWUIBXI+gevDTVRIJIOj\n' +
      'xSrxNbEZr05uaxGUbFEhLYhi84YtVuPqXGY7Wt2lDt7I7q2BTa0KMs+HdwR3B6dk\n' +
      'r0NahPqxo2ujqLUSErxSlxJTIxn/nzQUzFvMwxZLP3RgtSEO9Lb7l7G5jxgPbslP\n' +
      'ePDR96dyH1mmAoISiPPN3K6Jm7VYj9I5njhpMEZsm86ZZM7VKYu7ydnlx+eC3uPI\n' +
      'HxIuqdc4j3xnm/X+suV7W+c1s2joCJF4\n'                                 +
      '-----END PUBLIC KEY-----\n'
  },
  {
    algName: "DH_ffdhe3072",
    priKey:
      '-----BEGIN PRIVATE KEY-----\n'                                      +
      'MIIBxQIBADCCAZcGCSqGSIb3DQEDATCCAYgCggGBAP//////////rfhUWKK7Spqv\n' +
      '3FYgJz088di5xYPOLTaVqeE2QRRkM/vMk53OJJs++X0v42NjDHXY9oGyAq7EYXrT\n' +
      '3x7V1f1lYSQz9R9fBm7QhWNlVT3tGvO1VxNef1fJNZhPDHDg5ot34qaJ2vPv6HId\n' +
      '8VihNq3nNTCsyk9IOnl6vAqxgrMk+2HRCKlLssjj+7lq2rdg1/RoHU9Co945TfSu\n' +
      'Vu3nY3K7GQsHp8juCm1wngL84c334uzANATNKDQvYZFy/pzphYP/jk8SMu7ygYPD\n' +
      '/jsbTG+tczu1/LwuwiAFxY7xg30Wg7LG80omwbLv+ohrQjhhH8/c3jVbO2UZA1u8\n' +
      'NPTe+ZwCOGG0b8nW5skHetkdJpH39+5ZjLD6wYbZHK7+EwmFE5JwtBMMk7xDeUT0\n' +
      '/URS4tdN02Ty4h5x9Uv/XK6Cq5yd9p7obSvFIjY6DavFIZebDeraHb+aQtXESE4K\n' +
      'vNBr+lPd7zwbIO4/1Z18JeQdK2bGLjf//////////wIBAgQlAiMAs6PZWQwBILMI\n' +
      'EO7wtIzm+eS/QU95gY34U6wI9hYEYESZBg==\n'                             +
      '-----END PRIVATE KEY-----\n',
    pubKey:
      '-----BEGIN PUBLIC KEY-----\n'                                       +
      'MIIDJDCCAZcGCSqGSIb3DQEDATCCAYgCggGBAP//////////rfhUWKK7Spqv3FYg\n' +
      'Jz088di5xYPOLTaVqeE2QRRkM/vMk53OJJs++X0v42NjDHXY9oGyAq7EYXrT3x7V\n' +
      '1f1lYSQz9R9fBm7QhWNlVT3tGvO1VxNef1fJNZhPDHDg5ot34qaJ2vPv6HId8Vih\n' +
      'Nq3nNTCsyk9IOnl6vAqxgrMk+2HRCKlLssjj+7lq2rdg1/RoHU9Co945TfSuVu3n\n' +
      'Y3K7GQsHp8juCm1wngL84c334uzANATNKDQvYZFy/pzphYP/jk8SMu7ygYPD/jsb\n' +
      'TG+tczu1/LwuwiAFxY7xg30Wg7LG80omwbLv+ohrQjhhH8/c3jVbO2UZA1u8NPTe\n' +
      '+ZwCOGG0b8nW5skHetkdJpH39+5ZjLD6wYbZHK7+EwmFE5JwtBMMk7xDeUT0/URS\n' +
      '4tdN02Ty4h5x9Uv/XK6Cq5yd9p7obSvFIjY6DavFIZebDeraHb+aQtXESE4KvNBr\n' +
      '+lPd7zwbIO4/1Z18JeQdK2bGLjf//////////wIBAgOCAYUAAoIBgF+srD7DFInJ\n' +
      'TAF7Duhbyn7FjF7avTWJMkqzfHi1r86m3HDkFzxHgXgQR6i7ClGCy5xUo0qnhusf\n' +
      '3KsjkmfYEtoq/GI9WdCDenm5El38BNqd6JEaMEO5fxRZYl7Ovu9Cj50pIFZUgSro\n' +
      'M435tAWEBKXaIaNcHbO0E7JxSVIVcMkHUsXazFyhjCM6N5ZK1wSClgkQ9JV1xxo7\n' +
      '3Y2yDo3k42mCwMin0DEupkatos2Iyd3eW1bcfON7wQM8XFODBXjVHWhpDZ0S3pRZ\n' +
      'W9wfmfIy6c4EEwLvmJpBNjN2VrE/+iJVsorYkJm229KH1ENbs98uHbLTm/4A92xS\n' +
      '8p/f3JzHopdaHsqaw5HSabxcpo15YKDC9ewlJdojZb7MhDA4NOWMlBK3qIqI0IYW\n' +
      '2HPQ1y+KNRSovuz3ZRI2AZZKug18zipQqEQbfc64LctEumkaJiVkzdoCq6XoWtxP\n' +
      'RTpDsqC8S40NenEnR5Il07qi7Gfs1hLCTgT4el7Dwha2hyWpbKXNpw==\n'         +
      '-----END PUBLIC KEY-----\n'
  },
  {
    algName: "DH_ffdhe4096",
    priKey:
      '-----BEGIN PRIVATE KEY-----\n'                                      +
      'MIICSwIBADCCAhcGCSqGSIb3DQEDATCCAggCggIBAP//////////rfhUWKK7Spqv\n' +
      '3FYgJz088di5xYPOLTaVqeE2QRRkM/vMk53OJJs++X0v42NjDHXY9oGyAq7EYXrT\n' +
      '3x7V1f1lYSQz9R9fBm7QhWNlVT3tGvO1VxNef1fJNZhPDHDg5ot34qaJ2vPv6HId\n' +
      '8VihNq3nNTCsyk9IOnl6vAqxgrMk+2HRCKlLssjj+7lq2rdg1/RoHU9Co945TfSu\n' +
      'Vu3nY3K7GQsHp8juCm1wngL84c334uzANATNKDQvYZFy/pzphYP/jk8SMu7ygYPD\n' +
      '/jsbTG+tczu1/LwuwiAFxY7xg30Wg7LG80omwbLv+ohrQjhhH8/c3jVbO2UZA1u8\n' +
      'NPTe+ZwCOGG0b8nW5skHetkdJpH39+5ZjLD6wYbZHK7+EwmFE5JwtBMMk7xDeUT0\n' +
      '/URS4tdN02Ty4h5x9Uv/XK6Cq5yd9p7obSvFIjY6DavFIZebDeraHb+aQtXESE4K\n' +
      'vNBr+lPd7zwbIO4/1Z18JeQdK2aeHvFub1LDFk30+3kw6eTliFe2rH1fQtafbRh3\n' +
      'Y88dVQNABIf1W6V+Mcx6cTXIhu+0MYrtah4BLZ5oMqkHYAqRgTDEbcd4+XGtADgJ\n' +
      'KZmjM8uLehoduT1xQAA8Kk7OqfmNCswKgpHNzsl9z47JtVp/iKRrTbWoUfRBguHG\n' +
      'igB+XmVfav//////////AgECBCsCKQp3naqHfKyZkUYOs7YP83O1fETUlkcZisJR\n' +
      'IWA8wGtvVyHeuYo3OAxE\n'                                             +
      '-----END PRIVATE KEY-----\n',
    pubKey:
      '-----BEGIN PUBLIC KEY-----\n'                                       +
      'MIIEJDCCAhcGCSqGSIb3DQEDATCCAggCggIBAP//////////rfhUWKK7Spqv3FYg\n' +
      'Jz088di5xYPOLTaVqeE2QRRkM/vMk53OJJs++X0v42NjDHXY9oGyAq7EYXrT3x7V\n' +
      '1f1lYSQz9R9fBm7QhWNlVT3tGvO1VxNef1fJNZhPDHDg5ot34qaJ2vPv6HId8Vih\n' +
      'Nq3nNTCsyk9IOnl6vAqxgrMk+2HRCKlLssjj+7lq2rdg1/RoHU9Co945TfSuVu3n\n' +
      'Y3K7GQsHp8juCm1wngL84c334uzANATNKDQvYZFy/pzphYP/jk8SMu7ygYPD/jsb\n' +
      'TG+tczu1/LwuwiAFxY7xg30Wg7LG80omwbLv+ohrQjhhH8/c3jVbO2UZA1u8NPTe\n' +
      '+ZwCOGG0b8nW5skHetkdJpH39+5ZjLD6wYbZHK7+EwmFE5JwtBMMk7xDeUT0/URS\n' +
      '4tdN02Ty4h5x9Uv/XK6Cq5yd9p7obSvFIjY6DavFIZebDeraHb+aQtXESE4KvNBr\n' +
      '+lPd7zwbIO4/1Z18JeQdK2aeHvFub1LDFk30+3kw6eTliFe2rH1fQtafbRh3Y88d\n' +
      'VQNABIf1W6V+Mcx6cTXIhu+0MYrtah4BLZ5oMqkHYAqRgTDEbcd4+XGtADgJKZmj\n' +
      'M8uLehoduT1xQAA8Kk7OqfmNCswKgpHNzsl9z47JtVp/iKRrTbWoUfRBguHGigB+\n' +
      'XmVfav//////////AgECA4ICBQACggIAGw9owVmRxKfS3sH7iYGFFP1xymcPVa3+\n' +
      'WNetrWo41UO6yhByYfP5M5Psro777AigCwQwO/p4IBozlhs2eB3K8Gzm/pONCcsa\n' +
      '+lSMPl25rtSTHk6CYdCPlC4nQbxZJ1v6eThbpT7YoglHFACto94iJThV5SHBl1fU\n' +
      'xO0AyxSair/l8ddYb3TdHL9Y2y+N0p3GQR0MnRE64VMhEvsbp1xGTFo6uAeF2cLg\n' +
      'TfsY1U0IVb2I2dHvZyyauBsWq64h1/ag1m9RUEER7kufWcOAS1ht1/tZs1v6aFgk\n' +
      'ZG4ABN568+PO3mPC4FdjdrDhaqJ5Ih5S3BcZnKQXIfAafObsyZumrIVpQ19MVYgO\n' +
      'qEk0Ovs4yyz6LlXacaBL3a6WfrUDwua/zo14MuXsB10P9c4cfVz1UtIOu79UecUB\n' +
      'uKD/Kz2VwH6GHRwLkWYptrF52ShWOjphjaqJjeGlEWKsIjwC/ekDPx6XPvtNhcgi\n' +
      'enEYWVx9XcyGuMtkaqsCh6+WdG95/nW2aPjuFx34/7245R2Hj2/I77j7Am9mk4+D\n' +
      'MyMPX+0WdRUsDAhkB/ZG8ayLPhtowrwNuOVY7AEPNpDezuzh4ql1BUjc8NNnNFU7\n' +
      'qmQj+LgsieG6FCLMf597JjJL06dD/WgEshNU+XTsH6z9WqlF+UdmopE6uB6/iraV\n' +
      'E+YABhjAZcI=\n'                                                     +
      '-----END PUBLIC KEY-----\n'
  },
  {
    algName: "DH_ffdhe6144",
    priKey:
      '-----BEGIN PRIVATE KEY-----\n'                                      +
      'MIIDUQIBADCCAxcGCSqGSIb3DQEDATCCAwgCggMBAP//////////rfhUWKK7Spqv\n' +
      '3FYgJz088di5xYPOLTaVqeE2QRRkM/vMk53OJJs++X0v42NjDHXY9oGyAq7EYXrT\n' +
      '3x7V1f1lYSQz9R9fBm7QhWNlVT3tGvO1VxNef1fJNZhPDHDg5ot34qaJ2vPv6HId\n' +
      '8VihNq3nNTCsyk9IOnl6vAqxgrMk+2HRCKlLssjj+7lq2rdg1/RoHU9Co945TfSu\n' +
      'Vu3nY3K7GQsHp8juCm1wngL84c334uzANATNKDQvYZFy/pzphYP/jk8SMu7ygYPD\n' +
      '/jsbTG+tczu1/LwuwiAFxY7xg30Wg7LG80omwbLv+ohrQjhhH8/c3jVbO2UZA1u8\n' +
      'NPTe+ZwCOGG0b8nW5skHetkdJpH39+5ZjLD6wYbZHK7+EwmFE5JwtBMMk7xDeUT0\n' +
      '/URS4tdN02Ty4h5x9Uv/XK6Cq5yd9p7obSvFIjY6DavFIZebDeraHb+aQtXESE4K\n' +
      'vNBr+lPd7zwbIO4/1Z18JeQdK2aeHvFub1LDFk30+3kw6eTliFe2rH1fQtafbRh3\n' +
      'Y88dVQNABIf1W6V+Mcx6cTXIhu+0MYrtah4BLZ5oMqkHYAqRgTDEbcd4+XGtADgJ\n' +
      'KZmjM8uLehoduT1xQAA8Kk7OqfmNCswKgpHNzsl9z47JtVp/iKRrTbWoUfRBguHG\n' +
      'igB+Xg3ZAgv9ZLZFA2x6Tmd9LDhTKjojukRCyvU+pju0VDKbdiTIkXvdZLHA/Uyz\n' +
      'jowzTHAcOs2tBlf8z+xxmx9cPk5GBB84gUf7TP20d6UkcfepqWkQuFUyLttjQNig\n' +
      'DvCSNQUR4wq+wf/546Juf7KfjBgwI8NYfjjaAHfZtHY+TkuUsrvBlMZlHnfK+ZLu\n' +
      'qsAjKigb9rOnOcEiYRaCCujbWEemfL75yQkbRi1TjNcrA3Rq539eYiksMRViqEZQ\n' +
      'XcgtuFQziuSfUjXJW5EXjM8t1crO9APsnRgQxicrBFs7cfnca4DWP91KjprbHmli\n' +
      'ppUm1DFhwaQdVw15ONrUpA4ynNDkDmX//////////wIBAgQxAi9D0rgpePWZIcC7\n' +
      '4b1f51EJIlh14HbdtZsXOTY8NkCulvu7OGfFHX+sdKV0xU5OVg==\n'             +
      '-----END PRIVATE KEY-----\n',
    pubKey:
      '-----BEGIN PUBLIC KEY-----\n'                                       +
      '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\n'         +
      '-----END PUBLIC KEY-----\n'
  },
  {
    algName: "DH_ffdhe8192",
    priKey:
      '-----BEGIN PRIVATE KEY-----\n'                                      +
      'MIIEVQIBADCCBBcGCSqGSIb3DQEDATCCBAgCggQBAP//////////rfhUWKK7Spqv\n' +
      '3FYgJz088di5xYPOLTaVqeE2QRRkM/vMk53OJJs++X0v42NjDHXY9oGyAq7EYXrT\n' +
      '3x7V1f1lYSQz9R9fBm7QhWNlVT3tGvO1VxNef1fJNZhPDHDg5ot34qaJ2vPv6HId\n' +
      '8VihNq3nNTCsyk9IOnl6vAqxgrMk+2HRCKlLssjj+7lq2rdg1/RoHU9Co945TfSu\n' +
      'Vu3nY3K7GQsHp8juCm1wngL84c334uzANATNKDQvYZFy/pzphYP/jk8SMu7ygYPD\n' +
      '/jsbTG+tczu1/LwuwiAFxY7xg30Wg7LG80omwbLv+ohrQjhhH8/c3jVbO2UZA1u8\n' +
      'NPTe+ZwCOGG0b8nW5skHetkdJpH39+5ZjLD6wYbZHK7+EwmFE5JwtBMMk7xDeUT0\n' +
      '/URS4tdN02Ty4h5x9Uv/XK6Cq5yd9p7obSvFIjY6DavFIZebDeraHb+aQtXESE4K\n' +
      'vNBr+lPd7zwbIO4/1Z18JeQdK2aeHvFub1LDFk30+3kw6eTliFe2rH1fQtafbRh3\n' +
      'Y88dVQNABIf1W6V+Mcx6cTXIhu+0MYrtah4BLZ5oMqkHYAqRgTDEbcd4+XGtADgJ\n' +
      'KZmjM8uLehoduT1xQAA8Kk7OqfmNCswKgpHNzsl9z47JtVp/iKRrTbWoUfRBguHG\n' +
      'igB+Xg3ZAgv9ZLZFA2x6Tmd9LDhTKjojukRCyvU+pju0VDKbdiTIkXvdZLHA/Uyz\n' +
      'jowzTHAcOs2tBlf8z+xxmx9cPk5GBB84gUf7TP20d6UkcfepqWkQuFUyLttjQNig\n' +
      'DvCSNQUR4wq+wf/546Juf7KfjBgwI8NYfjjaAHfZtHY+TkuUsrvBlMZlHnfK+ZLu\n' +
      'qsAjKigb9rOnOcEiYRaCCujbWEemfL75yQkbRi1TjNcrA3Rq539eYiksMRViqEZQ\n' +
      'XcgtuFQziuSfUjXJW5EXjM8t1crO9APsnRgQxicrBFs7cfnca4DWP91KjprbHmli\n' +
      'ppUm1DFhwaQdVw15ONrUpA4ynM/0aqo2rQBM9gDIOB5CWjHZUa5k/bI/zslQnUNo\n' +
      'f+tp7dHMXguMw732SxDvhrYxQqOriClVWy90fJMmZcssDxzAG9cCKTiIOdKvBeRU\n' +
      'UErHi3WCgihGwLo1w19cWRYMwEb9glFUH8aMnIawIrtwmYdqRg50UaipMQlwP+4c\n' +
      'IX5sOCblLFGqaR4OQjz8menjFlDBIXtiSBbNrZqV+dW4AZSI2cCgof4wdaV34jGD\n' +
      '+B1KPy+kVx78jOC6ik/otoVd/nKwpm7e0vur++WKMPr6vhxdcah+L3Qe+MH+hv6m\n' +
      'u/3lMGd/DZfRHUn3qEQ9CCLlBqn0YU4BHiqUg4/4jNaMi7fFxkJM//////////8C\n' +
      'AQIENQIzAM498kyICk6xskzHZkdZAO7ONW9uWe2LH6+q6KngArD3p4UGoysIreox\n' +
      'PzfxQC0U7ZNa\n'                                                     +
      '-----END PRIVATE KEY-----\n',
    pubKey:
      '-----BEGIN PUBLIC KEY-----\n'                                       +
      'MIIIJDCCBBcGCSqGSIb3DQEDATCCBAgCggQBAP//////////rfhUWKK7Spqv3FYg\n' +
      'Jz088di5xYPOLTaVqeE2QRRkM/vMk53OJJs++X0v42NjDHXY9oGyAq7EYXrT3x7V\n' +
      '1f1lYSQz9R9fBm7QhWNlVT3tGvO1VxNef1fJNZhPDHDg5ot34qaJ2vPv6HId8Vih\n' +
      'Nq3nNTCsyk9IOnl6vAqxgrMk+2HRCKlLssjj+7lq2rdg1/RoHU9Co945TfSuVu3n\n' +
      'Y3K7GQsHp8juCm1wngL84c334uzANATNKDQvYZFy/pzphYP/jk8SMu7ygYPD/jsb\n' +
      'TG+tczu1/LwuwiAFxY7xg30Wg7LG80omwbLv+ohrQjhhH8/c3jVbO2UZA1u8NPTe\n' +
      '+ZwCOGG0b8nW5skHetkdJpH39+5ZjLD6wYbZHK7+EwmFE5JwtBMMk7xDeUT0/URS\n' +
      '4tdN02Ty4h5x9Uv/XK6Cq5yd9p7obSvFIjY6DavFIZebDeraHb+aQtXESE4KvNBr\n' +
      '+lPd7zwbIO4/1Z18JeQdK2aeHvFub1LDFk30+3kw6eTliFe2rH1fQtafbRh3Y88d\n' +
      'VQNABIf1W6V+Mcx6cTXIhu+0MYrtah4BLZ5oMqkHYAqRgTDEbcd4+XGtADgJKZmj\n' +
      'M8uLehoduT1xQAA8Kk7OqfmNCswKgpHNzsl9z47JtVp/iKRrTbWoUfRBguHGigB+\n' +
      'Xg3ZAgv9ZLZFA2x6Tmd9LDhTKjojukRCyvU+pju0VDKbdiTIkXvdZLHA/Uyzjowz\n' +
      'THAcOs2tBlf8z+xxmx9cPk5GBB84gUf7TP20d6UkcfepqWkQuFUyLttjQNigDvCS\n' +
      'NQUR4wq+wf/546Juf7KfjBgwI8NYfjjaAHfZtHY+TkuUsrvBlMZlHnfK+ZLuqsAj\n' +
      'Kigb9rOnOcEiYRaCCujbWEemfL75yQkbRi1TjNcrA3Rq539eYiksMRViqEZQXcgt\n' +
      'uFQziuSfUjXJW5EXjM8t1crO9APsnRgQxicrBFs7cfnca4DWP91KjprbHmlippUm\n' +
      '1DFhwaQdVw15ONrUpA4ynM/0aqo2rQBM9gDIOB5CWjHZUa5k/bI/zslQnUNof+tp\n' +
      '7dHMXguMw732SxDvhrYxQqOriClVWy90fJMmZcssDxzAG9cCKTiIOdKvBeRUUErH\n' +
      'i3WCgihGwLo1w19cWRYMwEb9glFUH8aMnIawIrtwmYdqRg50UaipMQlwP+4cIX5s\n' +
      'OCblLFGqaR4OQjz8menjFlDBIXtiSBbNrZqV+dW4AZSI2cCgof4wdaV34jGD+B1K\n' +
      'Py+kVx78jOC6ik/otoVd/nKwpm7e0vur++WKMPr6vhxdcah+L3Qe+MH+hv6mu/3l\n' +
      'MGd/DZfRHUn3qEQ9CCLlBqn0YU4BHiqUg4/4jNaMi7fFxkJM//////////8CAQID\n' +
      'ggQFAAKCBABs6LarqHEViwGwTCXn09lmUo0yoReMkTyh5MmBKbH2iSMFiEAk72Es\n' +
      'TjBm8CZZ1D2LN3NbIB2ErXe33bEcUvbW73AosSlbuI/duVlZLHnjUPGWytm8Sunq\n' +
      'Up+0A69YpnOpt0NEv4ESJf3WnxylzKM2zCKbGeS1t9KwOd8BkbmAD3i0WDClCfYC\n' +
      '+8Pc7yg5YvFV9xY875w8k57JCaukjzbhtqxGp20vEMxSRuhup1wNCecKgJ6tRAf4\n' +
      'mma+GcvJtaOuCHVwwJArAeKfsS4c69KWLKbmpvefn4rJS95DDtqdRHcQDATp6abW\n' +
      'em2/kLfsbFeX5QqzcpHlBWVbqvkg0Z/wAnhXgo7OpaaTLymuARMZEKm1WkZij64o\n' +
      '8SSOReZK/dYUQBXq+CtlscfibD48LBlTNfyTRAZB/x/Ch6t1ggwX5dQeJgEr1TRA\n' +
      'W/yU4Hv6GYOTRNlo5YKM4nltN8OCQHvjwvNlkpdkQeuDzmMmRif2xBeEO1sVRIBa\n' +
      'M/iNXGGZiBrnjO58yp9iIabI74lDEzKSOGQvpTMoD9k/SDIqRANUvFQWxmGIYTtN\n' +
      'Yl6/POWuhECWcfwS4FSjdFCZp3lAXw6Fb8HisQYWZNmpcpUsdCxUjSsHV8KRBuVB\n' +
      'VTuTLAXt5ns4Q0r31g+wxCiehHmBj///JiAdB00zyk2mmzsNK8W3o7SOtRDjW63x\n' +
      'OvF11hIKuhVQjxBjz8lA/X9HWJctGuFGrTv5qUDz0Sx8oW9bupjzEbohznqF4gCu\n' +
      'sNLaLZi9XzCnSu1qkDQ3Zga/tGjYi/Xqn5ntuvJ+hY7HLdjnBPmGytn31Tf6RXRC\n' +
      '5saiC73OamXmdN6NkzU93ww6pDCDfhk3zUUZF5zuN8M26PaqIXoHnJi5HQM1pc5z\n' +
      'bX7UYbU0mEYAUqv3OcGIE77iiQxNwJVJJnw7QzrVGEzgLML+5vGOjAM35lk27Epo\n' +
      'xi2d30pf+snFk6x83koZIyJit/NrZOWMei++2/K6bKtBwqdg6BaVPW9ajxDrpG0w\n' +
      'jx6u+tvjSINIPHjPD7fda3IIe8uyNE1iuWn2YtbAR1Z+y+DxJYSunkTo9NjJupuv\n' +
      'eC1oMSMmddkm1CgmPEAYpqHet4fVDoirtB8VF6ST20t6J1adOGvpU94N86026iO9\n' +
      'XU/BCedsJCGq6v4XA0A8MYzS955ofFPdv2d8y2m6IHdNVRcRcVNHX5QVbOon7FeW\n' +
      'aULLCOVcUCh8gSopy/xaQEz6RYQygUEAU2g5IvQcWL5Fzqxh+x7jleCKfXFzb94X\n' +
      '89q+O8+tQxaKOy1mdessercp6exGIH972IcWSfjH7ws14OaaJ1YON4oj7bfRms8Z\n' +
      '1ba4gLxZM/VeG/9O0cMBhEyv41Ldjp0B\n'                                 +
      '-----END PUBLIC KEY-----\n'
  },
  {
    algName: "DH_modp1536",
    priKey:
      '-----BEGIN PRIVATE KEY-----\n'                                      +
      'MIH4AgEAMIHVBgkqhkiG9w0BAwEwgccCgcEA///////////JD9qiIWjCNMTGYouA\n' +
      '3BzRKQJOCIpnzHQCC76mOxObIlFKCHmONATd75UZs806QxswKwpt8l8UN0/hNW1t\n' +
      'UcJF5IW1dmJefsb0TELppjftawv/XLb0Brft7jhr+1qJn6WunyQRfEsf5kkoZlHs\n' +
      '5Fs9wgB8uKFjvwWY2kg2HFXTmmkWP6j9JM9fg2VdI9yjrZYcYvNWIIVSu57VKQdw\n' +
      'lpZtZww1Tkq8mATxdGwIyiNzJ///////////AgECBBsCGR6F9KWkU6w0tfMsUxuw\n' +
      'cT19GZv2khb+qfk=\n'                                                 +
      '-----END PRIVATE KEY-----\n',
    pubKey:
      '-----BEGIN PUBLIC KEY-----\n'                                       +
      'MIIBoDCB1QYJKoZIhvcNAQMBMIHHAoHBAP//////////yQ/aoiFowjTExmKLgNwc\n' +
      '0SkCTgiKZ8x0Agu+pjsTmyJRSgh5jjQE3e+VGbPNOkMbMCsKbfJfFDdP4TVtbVHC\n' +
      'ReSFtXZiXn7G9ExC6aY37WsL/1y29Aa37e44a/taiZ+lrp8kEXxLH+ZJKGZR7ORb\n' +
      'PcIAfLihY78FmNpINhxV05ppFj+o/STPX4NlXSPco62WHGLzViCFUrue1SkHcJaW\n' +
      'bWcMNU5KvJgE8XRsCMojcyf//////////wIBAgOBxQACgcEArUh5hi507LdnGfXb\n' +
      'i3/IRC2rM2DfPRyIp5uzdZ/SQEL5Nzwc5pPmHXEdAccMMtaFk/v7TfO+EYtFYxuU\n' +
      'anZnbqWiPnJIxErlA7mWihadiEDWfkxP/fUzNFium82IypvT+KqbdFIvJ9ihJ/Uu\n' +
      'IWK8aKn0ZrXJRvvhg5F+sq+SZ/NCv1eoAjBaoOl3WNrA6YD+TRIlXoKI22Joc+qd\n' +
      'RarZ1K/kYfaWCRCDLlzFmYSLrqB2T5vdzmBAxLa1GN0lqX/0\n'                 +
      '-----END PUBLIC KEY-----\n'
  },
  {
    algName: "DH_modp2048",
    priKey:
      '-----BEGIN PRIVATE KEY-----\n'                                      +
      'MIIBPwIBADCCARcGCSqGSIb3DQEDATCCAQgCggEBAP//////////yQ/aoiFowjTE\n' +
      'xmKLgNwc0SkCTgiKZ8x0Agu+pjsTmyJRSgh5jjQE3e+VGbPNOkMbMCsKbfJfFDdP\n' +
      '4TVtbVHCReSFtXZiXn7G9ExC6aY37WsL/1y29Aa37e44a/taiZ+lrp8kEXxLH+ZJ\n' +
      'KGZR7ORbPcIAfLihY78FmNpINhxV05ppFj+o/STPX4NlXSPco62WHGLzViCFUrue\n' +
      '1SkHcJaWbWcMNU5KvJgE8XRsCMoYIXwykF5GLjbOO+OedywYDoYDmyeDouwHoo+1\n' +
      'xV3wb0xSyd4ry/aVWBcYOZVJfOqVauUV0iYYmPoFEBVyjlqKrKpo//////////8C\n' +
      'AQIEHwIdAKk4Yyc/192ynBy708zjGha7IsFvurKUP7DIE/Y=\n'                 +
      '-----END PRIVATE KEY-----\n',
    pubKey:
      '-----BEGIN PUBLIC KEY-----\n'                                       +
      'MIICJDCCARcGCSqGSIb3DQEDATCCAQgCggEBAP//////////yQ/aoiFowjTExmKL\n' +
      'gNwc0SkCTgiKZ8x0Agu+pjsTmyJRSgh5jjQE3e+VGbPNOkMbMCsKbfJfFDdP4TVt\n' +
      'bVHCReSFtXZiXn7G9ExC6aY37WsL/1y29Aa37e44a/taiZ+lrp8kEXxLH+ZJKGZR\n' +
      '7ORbPcIAfLihY78FmNpINhxV05ppFj+o/STPX4NlXSPco62WHGLzViCFUrue1SkH\n' +
      'cJaWbWcMNU5KvJgE8XRsCMoYIXwykF5GLjbOO+OedywYDoYDmyeDouwHoo+1xV3w\n' +
      'b0xSyd4ry/aVWBcYOZVJfOqVauUV0iYYmPoFEBVyjlqKrKpo//////////8CAQID\n' +
      'ggEFAAKCAQAale6hp8pKIypjuZ2GCQlQrle23gsFS+s4Bk6l43Qlye3w8Qoh0dYz\n' +
      'mGqxMt9atB3tQrp+Vejnh5Ezq8p/nko4iTyW6q7otJpa8UUDFC8wTR6hpEx01hEx\n' +
      'JKBs1afj61K0bDm1r3DYrBNXB52TXsXPLR7yRGSyPeidpW4zo4EeCLXQblktDXjx\n' +
      'gyKBbf/Y/MHbCxNC2iEQnce2LZVqXKiAPIMcqRwUfR1Co59Gn67mfYSmeRQyKfjE\n' +
      'ZbxqFR+BEHwb797BwFjTqY4LivJaxuo1cKdCe/p6TJQ40TmMvRlC8wPZkitonip1\n' +
      'sID4+LkP4YMXDQ1esxC/Vh+jbDu6kk4F\n'                                 +
      '-----END PUBLIC KEY-----\n'
  },
  {
    algName: "DH_modp3072",
    priKey:
      '-----BEGIN PRIVATE KEY-----\n'                                      +
      'MIIBxQIBADCCAZcGCSqGSIb3DQEDATCCAYgCggGBAP//////////yQ/aoiFowjTE\n' +
      'xmKLgNwc0SkCTgiKZ8x0Agu+pjsTmyJRSgh5jjQE3e+VGbPNOkMbMCsKbfJfFDdP\n' +
      '4TVtbVHCReSFtXZiXn7G9ExC6aY37WsL/1y29Aa37e44a/taiZ+lrp8kEXxLH+ZJ\n' +
      'KGZR7ORbPcIAfLihY78FmNpINhxV05ppFj+o/STPX4NlXSPco62WHGLzViCFUrue\n' +
      '1SkHcJaWbWcMNU5KvJgE8XRsCMoYIXwykF5GLjbOO+OedywYDoYDmyeDouwHoo+1\n' +
      'xV3wb0xSyd4ry/aVWBcYOZVJfOqVauUV0iYYmPoFEBVyjlqKqsQtrTMXDQRQejOo\n' +
      'VSGr3xy6ZOz7hQRY2+8KiupxV10GDH2zlw+FpuHkx6v1rozbCTPXHoyU4EolYZ3O\n' +
      '49ImGtLua/Ev+gbZighk2HYCcz7IamRSHysYF3sgDLvhF1d6YV1sdwmIwLrZRuII\n' +
      '4k+gdOWrMUPbW/zg/RCOS4LRIKk60sr//////////wIBAgQlAiMBEUjNc/iLknYp\n' +
      'uHG21LqMYN43Z/7s+S0El8Tu3/SjmPZZYA==\n'                             +
      '-----END PRIVATE KEY-----\n',
    pubKey:
      '-----BEGIN PUBLIC KEY-----\n'                                       +
      'MIIDJTCCAZcGCSqGSIb3DQEDATCCAYgCggGBAP//////////yQ/aoiFowjTExmKL\n' +
      'gNwc0SkCTgiKZ8x0Agu+pjsTmyJRSgh5jjQE3e+VGbPNOkMbMCsKbfJfFDdP4TVt\n' +
      'bVHCReSFtXZiXn7G9ExC6aY37WsL/1y29Aa37e44a/taiZ+lrp8kEXxLH+ZJKGZR\n' +
      '7ORbPcIAfLihY78FmNpINhxV05ppFj+o/STPX4NlXSPco62WHGLzViCFUrue1SkH\n' +
      'cJaWbWcMNU5KvJgE8XRsCMoYIXwykF5GLjbOO+OedywYDoYDmyeDouwHoo+1xV3w\n' +
      'b0xSyd4ry/aVWBcYOZVJfOqVauUV0iYYmPoFEBVyjlqKqsQtrTMXDQRQejOoVSGr\n' +
      '3xy6ZOz7hQRY2+8KiupxV10GDH2zlw+FpuHkx6v1rozbCTPXHoyU4EolYZ3O49Im\n' +
      'GtLua/Ev+gbZighk2HYCcz7IamRSHysYF3sgDLvhF1d6YV1sdwmIwLrZRuII4k+g\n' +
      'dOWrMUPbW/zg/RCOS4LRIKk60sr//////////wIBAgOCAYYAAoIBgQD6c3g4cZvv\n' +
      '0n7WRCtLfDTgpay7OBo1EwAlwpmJuJxn/pqhoVoF0I3KRJ8IPrV7V0WjkzCg/Qnu\n' +
      '7tZ0FxWnpBT1M4qwi1NYIGv+AdSOjqrrlPtUq9TdkFlQHJ4Fib55htyZO4KpX5fO\n' +
      'T3e1sgmxL4A5D7ApnI1807/VLi86XmnXHnUvJJk+hKT73sY3cJ7YogTnLB4PB/DU\n' +
      'OhZ60yNhFDytKP5Bv+XnGiNk/RtqsIzbOile+I0GbS4kGpVLaluvsh/h6NZE+BRr\n' +
      'oJC56FP9ku+yRijkEpFy0hBZv5zDayscgjWuE5TNePp/C7cujDvpbX3C106PbAfg\n' +
      'QTDXfUbLB4KkoGEDt/ASVDMxCbp8najnqUT5NWc0QLx5fViya0dzB3HSH/nleog4\n' +
      'MXThz4q5KwuhLaNPAcfU/uZTUtaMFzrHQPpC6HLyfkeys3jtTCdI20Fl2HC0c511\n' +
      'aggMTwOh/bW4e3z9WWWTYlVrIRPMtoBoLcwzDMp8PksOCFe2uv8X5fQ=\n'         +
      '-----END PUBLIC KEY-----\n'
  },
  {
    algName: "DH_modp4096",
    priKey:
      '-----BEGIN PRIVATE KEY-----\n'                                      +
      'MIICSwIBADCCAhcGCSqGSIb3DQEDATCCAggCggIBAP//////////yQ/aoiFowjTE\n' +
      'xmKLgNwc0SkCTgiKZ8x0Agu+pjsTmyJRSgh5jjQE3e+VGbPNOkMbMCsKbfJfFDdP\n' +
      '4TVtbVHCReSFtXZiXn7G9ExC6aY37WsL/1y29Aa37e44a/taiZ+lrp8kEXxLH+ZJ\n' +
      'KGZR7ORbPcIAfLihY78FmNpINhxV05ppFj+o/STPX4NlXSPco62WHGLzViCFUrue\n' +
      '1SkHcJaWbWcMNU5KvJgE8XRsCMoYIXwykF5GLjbOO+OedywYDoYDmyeDouwHoo+1\n' +
      'xV3wb0xSyd4ry/aVWBcYOZVJfOqVauUV0iYYmPoFEBVyjlqKqsQtrTMXDQRQejOo\n' +
      'VSGr3xy6ZOz7hQRY2+8KiupxV10GDH2zlw+FpuHkx6v1rozbCTPXHoyU4EolYZ3O\n' +
      '49ImGtLua/Ev+gbZighk2HYCcz7IamRSHysYF3sgDLvhF1d6YV1sdwmIwLrZRuII\n' +
      '4k+gdOWrMUPbW/zg/RCOS4LRIKkhCAEacjwSp4fm14hxmhC9ulsmmcMnGGr04jwa\n' +
      'lGg0thUL2iWD6coq1Ezo27vC2wTejvkujvwUH77Kpih8WUdOa8BdmbKWT6CQw6Ij\n' +
      'O6GGUVvn7R9hKXDO4tevuBvddiFwSBzQBpEn1bBaqZO06piNj93Bhv+33JCmwI9N\n' +
      '9DXJNAYxmf//////////AgECBCsCKQawDTS62nDidIky6ZHOfuSpXTHsJm4JKowq\n' +
      'oOERSTz6a22EWArJEd7z\n'                                             +
      '-----END PRIVATE KEY-----\n',
    pubKey:
      '-----BEGIN PUBLIC KEY-----\n'                                       +
      'MIIEJTCCAhcGCSqGSIb3DQEDATCCAggCggIBAP//////////yQ/aoiFowjTExmKL\n' +
      'gNwc0SkCTgiKZ8x0Agu+pjsTmyJRSgh5jjQE3e+VGbPNOkMbMCsKbfJfFDdP4TVt\n' +
      'bVHCReSFtXZiXn7G9ExC6aY37WsL/1y29Aa37e44a/taiZ+lrp8kEXxLH+ZJKGZR\n' +
      '7ORbPcIAfLihY78FmNpINhxV05ppFj+o/STPX4NlXSPco62WHGLzViCFUrue1SkH\n' +
      'cJaWbWcMNU5KvJgE8XRsCMoYIXwykF5GLjbOO+OedywYDoYDmyeDouwHoo+1xV3w\n' +
      'b0xSyd4ry/aVWBcYOZVJfOqVauUV0iYYmPoFEBVyjlqKqsQtrTMXDQRQejOoVSGr\n' +
      '3xy6ZOz7hQRY2+8KiupxV10GDH2zlw+FpuHkx6v1rozbCTPXHoyU4EolYZ3O49Im\n' +
      'GtLua/Ev+gbZighk2HYCcz7IamRSHysYF3sgDLvhF1d6YV1sdwmIwLrZRuII4k+g\n' +
      'dOWrMUPbW/zg/RCOS4LRIKkhCAEacjwSp4fm14hxmhC9ulsmmcMnGGr04jwalGg0\n' +
      'thUL2iWD6coq1Ezo27vC2wTejvkujvwUH77Kpih8WUdOa8BdmbKWT6CQw6IjO6GG\n' +
      'UVvn7R9hKXDO4tevuBvddiFwSBzQBpEn1bBaqZO06piNj93Bhv+33JCmwI9N9DXJ\n' +
      'NAYxmf//////////AgECA4ICBgACggIBAJJlHygSixWYnuEhBz7FMDWf59xEHEMW\n' +
      'ghZuUs3GtPFl0xI44dUUVekyZhwHwL//ETw/BpgbCyhx4kYhhiD90pNPZBg5zJqI\n' +
      'XDSJU22v3VL8SK6bQS7Ha6rV+uy/0SkTA9sx1DsQOyySUNgibujgdCR6YS0g+lFk\n' +
      'Ef1c4nCTn0yhQEDAkJlTtSsQQgR60rcMV/8/aanFKUHbRAV9yuuKwZKkQo/ZfD3y\n' +
      'mY+cJRiGnmkKLvmtP7ogXHXDLpfm0YmHxkXeaNOcxl4Y/PMyr60P04POfO+2GCwU\n' +
      'n7jW+SQLwGut/SvofLEdWaYpl66F8VBHSgNq39aR7mLuwRiZpAC5tPcHPZcAxN6B\n' +
      'eI6v8AyAqIfMaYozUqETVONHG7EmPVnYDo7PNO8Z+VSnJlYfOxkCrPqchEEw33l+\n' +
      '64eWGCkzCJRwm73Yfzu+mHPtSrmVq2EUmAG8px6no3G+rZJQoK6Ig+GwauErXz6y\n' +
      '27I34aEWQhpwJm/WLmurYcXsEstDkt/7PULkvWd4QFZdfsNMgn0Ov20SYbzYLJFW\n' +
      'vynRnp++gav8vEKYWUY4WkZ2IHmHFpcsYWGlr9yYkYuBCLKyQxP6B1BYwvnkzWLN\n' +
      'z6YIVMszrCIFn+ofU6FXHLNTCEgLqIjNppPedN7GZn6vzdXLmyQso+2jdN080MD0\n' +
      'nmd99Rs/hIIi\n'                                                     +
      '-----END PUBLIC KEY-----\n'
  },
  {
    algName: "DH_modp6144",
    priKey:
      '-----BEGIN PRIVATE KEY-----\n'                                      +
      'MIIDUQIBADCCAxcGCSqGSIb3DQEDATCCAwgCggMBAP//////////yQ/aoiFowjTE\n' +
      'xmKLgNwc0SkCTgiKZ8x0Agu+pjsTmyJRSgh5jjQE3e+VGbPNOkMbMCsKbfJfFDdP\n' +
      '4TVtbVHCReSFtXZiXn7G9ExC6aY37WsL/1y29Aa37e44a/taiZ+lrp8kEXxLH+ZJ\n' +
      'KGZR7ORbPcIAfLihY78FmNpINhxV05ppFj+o/STPX4NlXSPco62WHGLzViCFUrue\n' +
      '1SkHcJaWbWcMNU5KvJgE8XRsCMoYIXwykF5GLjbOO+OedywYDoYDmyeDouwHoo+1\n' +
      'xV3wb0xSyd4ry/aVWBcYOZVJfOqVauUV0iYYmPoFEBVyjlqKqsQtrTMXDQRQejOo\n' +
      'VSGr3xy6ZOz7hQRY2+8KiupxV10GDH2zlw+FpuHkx6v1rozbCTPXHoyU4EolYZ3O\n' +
      '49ImGtLua/Ev+gbZighk2HYCcz7IamRSHysYF3sgDLvhF1d6YV1sdwmIwLrZRuII\n' +
      '4k+gdOWrMUPbW/zg/RCOS4LRIKkhCAEacjwSp4fm14hxmhC9ulsmmcMnGGr04jwa\n' +
      'lGg0thUL2iWD6coq1Ezo27vC2wTejvkujvwUH77Kpih8WUdOa8BdmbKWT6CQw6Ij\n' +
      'O6GGUVvn7R9hKXDO4tevuBvddiFwSBzQBpEn1bBaqZO06piNj93Bhv+33JCmwI9N\n' +
      '9DXJNAKEkjbD+rTSfHAmwdTcsmAmRt7JdR52Pbo3vfj/lAatnlMO5ds4L0EwAa6w\n' +
      'alPtkCfYMReXJ7CGWokY2j7b68+bFO1Ezmy6ztS7G9t/FEfmzCVLMyBRUSvXr0Jv\n' +
      'uPQBN4zSv1mDygHGS5Ls8DLqFdFyHQP0gtfObnT+9tVecC9GmAyCtahAMZALHJ5Z\n' +
      '58l/vsfo8yOpen42zIi+Dx1Ft/9YWsVL1AeyK0FUqsyPbX6/SOHYFMxe0g+AN+Cn\n' +
      'lxXu8pvjKAah1Yu3xdp29VCqPYofv/DrGcyxoxPVXNpWyewu8pYyOH/o1248BGgE\n' +
      'Po9mP0hg7hK/LVsLdHTW5pT5Hm3MQCT//////////wIBAgQxAi9BnrqSwwMlvV4v\n' +
      'TbnECoCKJexFmJLdDO0Nm06gz7x14rwoCik8ZJFgzLCQmwJE7g==\n'             +
      '-----END PRIVATE KEY-----\n',
    pubKey:
      '-----BEGIN PUBLIC KEY-----\n'                                       +
      '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\n'         +
      '-----END PUBLIC KEY-----\n'
  },
  {
    algName: "DH_modp8192",
    priKey:
      '-----BEGIN PRIVATE KEY-----\n'                                      +
      'MIIEVQIBADCCBBcGCSqGSIb3DQEDATCCBAgCggQBAP//////////yQ/aoiFowjTE\n' +
      'xmKLgNwc0SkCTgiKZ8x0Agu+pjsTmyJRSgh5jjQE3e+VGbPNOkMbMCsKbfJfFDdP\n' +
      '4TVtbVHCReSFtXZiXn7G9ExC6aY37WsL/1y29Aa37e44a/taiZ+lrp8kEXxLH+ZJ\n' +
      'KGZR7ORbPcIAfLihY78FmNpINhxV05ppFj+o/STPX4NlXSPco62WHGLzViCFUrue\n' +
      '1SkHcJaWbWcMNU5KvJgE8XRsCMoYIXwykF5GLjbOO+OedywYDoYDmyeDouwHoo+1\n' +
      'xV3wb0xSyd4ry/aVWBcYOZVJfOqVauUV0iYYmPoFEBVyjlqKqsQtrTMXDQRQejOo\n' +
      'VSGr3xy6ZOz7hQRY2+8KiupxV10GDH2zlw+FpuHkx6v1rozbCTPXHoyU4EolYZ3O\n' +
      '49ImGtLua/Ev+gbZighk2HYCcz7IamRSHysYF3sgDLvhF1d6YV1sdwmIwLrZRuII\n' +
      '4k+gdOWrMUPbW/zg/RCOS4LRIKkhCAEacjwSp4fm14hxmhC9ulsmmcMnGGr04jwa\n' +
      'lGg0thUL2iWD6coq1Ezo27vC2wTejvkujvwUH77Kpih8WUdOa8BdmbKWT6CQw6Ij\n' +
      'O6GGUVvn7R9hKXDO4tevuBvddiFwSBzQBpEn1bBaqZO06piNj93Bhv+33JCmwI9N\n' +
      '9DXJNAKEkjbD+rTSfHAmwdTcsmAmRt7JdR52Pbo3vfj/lAatnlMO5ds4L0EwAa6w\n' +
      'alPtkCfYMReXJ7CGWokY2j7b68+bFO1Ezmy6ztS7G9t/FEfmzCVLMyBRUSvXr0Jv\n' +
      'uPQBN4zSv1mDygHGS5Ls8DLqFdFyHQP0gtfObnT+9tVecC9GmAyCtahAMZALHJ5Z\n' +
      '58l/vsfo8yOpen42zIi+Dx1Ft/9YWsVL1AeyK0FUqsyPbX6/SOHYFMxe0g+AN+Cn\n' +
      'lxXu8pvjKAah1Yu3xdp29VCqPYofv/DrGcyxoxPVXNpWyewu8pYyOH/o1248BGgE\n' +
      'Po9mP0hg7hK/LVsLdHTW5pT5Hm2+EVl0o5JvEv7l5Dh3fLapMt+M2L7E0HO5Mbo7\n' +
      'yDK2jZ3TAHQfp7+K/EftJXb2k2ukJGY6q2OcWuT1aDQjtHQr8cl4I48Wy+OdZS3j\n' +
      '/bi+/ISK2SIiLgSkA3wHE+tXqBoj8Mc0c/xkbOowa0vLyIYvg4Xd+p1Lf6LAh+h5\n' +
      'aDMD7VvdOgYrPPWzonimbSoT+D9E+C3fMQ7gdKtqNkWX6JmgJV3BZPMcxQhGhR35\n' +
      'q0gZXe1+obHVEL1+501z+vNrwx7Pomg1kEb064efkkAJQ4tIHGzXiJoALtXuOCvJ\n' +
      'GQ2m/AJuR5VY5EdWd+mqnjBQ4nZWlN/IH1bogLlucWDJgN2Y7dPf//////////8C\n' +
      'AQIENQIzAJA6V8YgS39f2yjKWzyil2rEtbBzIRp8R0xpS9FHWNNK9yJfNOCWWyd4\n' +
      'JzZtAzDrGdvC\n'                                                     +
      '-----END PRIVATE KEY-----\n',
    pubKey:
      '-----BEGIN PUBLIC KEY-----\n'                                       +
      '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\n' +
      '3AVWr7ZnX/X8BT8rlhRTO6x6mQgntE2R\n'                                 +
      '-----END PUBLIC KEY-----\n'
  },
]

let sm2: KeyPairPemString[] = [
  {
    algName: "SM2_256",
    priKey:
      '-----BEGIN PRIVATE KEY-----\n'                                      +
      'MIGHAgEAMBMGByqGSM49AgEGCCqBHM9VAYItBG0wawIBAQQgrmbM2qtbdW9nm+YK\n' +
      'W8qrETUBXAm41OqDk/J60WlWKrihRANCAAQRb95pplI5ETd5ZtkJkEkbGeIAwTSx\n' +
      'Ch7zVXH0flhkrxE1Yv6ICCW5gJsAeFo8KskHXIJ2SnscDLv+7C8O3uBL\n'         +
      '-----END PRIVATE KEY-----\n',
    pubKey:
      '-----BEGIN PUBLIC KEY-----\n'                                       +
      'MFkwEwYHKoZIzj0CAQYIKoEcz1UBgi0DQgAEEW/eaaZSORE3eWbZCZBJGxniAME0\n' +
      'sQoe81Vx9H5YZK8RNWL+iAgluYCbAHhaPCrJB1yCdkp7HAy7/uwvDt7gSw==\n'     +
      '-----END PUBLIC KEY-----\n'                                         +
      '-----BEGIN CERTIFICATE-----\n'                                      +
      'MIIB9TCCAZugAwIBAgIUZyKAc71k+z2TOhlmdo/kcnKSIacwCgYIKoZIzj0EAwIw\n' +
      'UDELMAkGA1UEBhMCQ04xEDAOBgNVBAgMB3NoYW5neGkxDTALBgNVBAcMBHhpYW4x\n' +
      'DTALBgNVBAoMBHRlc3QxETAPBgNVBAMMCGNlcnR0ZXN0MB4XDTI0MDgxMzAyMTU0\n' +
      'M1oXDTM0MDUxMzAyMTU0M1owUDELMAkGA1UEBhMCQ04xEDAOBgNVBAgMB3NoYW5n\n' +
      'eGkxDTALBgNVBAcMBHhpYW4xDTALBgNVBAoMBHRlc3QxETAPBgNVBAMMCGNlcnR0\n' +
      'ZXN0MFkwEwYHKoZIzj0CAQYIKoEcz1UBgi0DQgAEEW/eaaZSORE3eWbZCZBJGxni\n' +
      'AME0sQoe81Vx9H5YZK8RNWL+iAgluYCbAHhaPCrJB1yCdkp7HAy7/uwvDt7gS6NT\n' +
      'MFEwHQYDVR0OBBYEFJWYzzER1A+pEVxB/g//xxluhdWTMB8GA1UdIwQYMBaAFJWY\n' +
      'zzER1A+pEVxB/g//xxluhdWTMA8GA1UdEwEB/wQFMAMBAf8wCgYIKoZIzj0EAwID\n' +
      'SAAwRQIgLFDHHYtQNmhJXNP0c0rK3IX2/7uLR15xLP9YCvAx5loCIQCH+UkVIKRq\n' +
      'uWsw8XibDTU3mvrvIh6ghZ6NgAF+FHd/Tw==\n'                             +
      '-----END CERTIFICATE-----\n'
  },
  {
    algName: "SM2_256",
    priKey:
      '-----BEGIN SM2 PARAMETERS-----\n'                                   +
      'BggqgRzPVQGCLQ==\n'                                                 +
      '-----END SM2 PARAMETERS-----\n'                                     +
      '-----BEGIN PRIVATE KEY-----\n'                                      +
      'MIGIAgEAMBQGCCqBHM9VAYItBggqgRzPVQGCLQRtMGsCAQEEIG7l+S5R+prpgJXT\n' +
      'ZSOom3boMq8H55myT6T95Jwrf6tVoUQDQgAEmIM+tlBz5e1y3vGW7vw0WZW/15Ab\n' +
      'wmC6T6NBiJbxieOyxOaXxcxIpaS9rkCzgGOwGK+t15WzoB0Kak2IAzfyZQ==\n'     +
      '-----END PRIVATE KEY-----\n',
    pubKey:
      '-----BEGIN PUBLIC KEY-----\n'                                       +
      'MFowFAYIKoEcz1UBgi0GCCqBHM9VAYItA0IABJiDPrZQc+Xtct7xlu78NFmVv9eQ\n' +
      'G8Jguk+jQYiW8YnjssTml8XMSKWkva5As4BjsBivrdeVs6AdCmpNiAM38mU=\n'     +
      '-----END PUBLIC KEY-----\n'
  },
  {
    algName: "SM2_256",
    priKey:
      '-----BEGIN EC PARAMETERS-----\n'                                    +
      'BggqgRzPVQGCLQ==\n'                                                 +
      '-----END EC PARAMETERS-----\n'                                      +
      '-----BEGIN EC PRIVATE KEY-----\n'                                   +
      'MHcCAQEEIDT2/LxsWMZeix95WhGPxWRRxUeVvyBjFy2O5NmkO581oAoGCCqBHM9V\n' +
      'AYItoUQDQgAE7EuzkI8w47fChyAxZYc+8Ss79QW50V4vfgF90P0VezRD+6bzsR45\n' +
      'nPU+RUgRSFI6K8e1i8M3rlmBoo+KFZupFw==\n'                             +
      '-----END EC PRIVATE KEY-----\n',
    pubKey:
      '-----BEGIN PUBLIC KEY-----\n'                                       +
      'MFkwEwYHKoZIzj0CAQYIKoEcz1UBgi0DQgAE7EuzkI8w47fChyAxZYc+8Ss79QW5\n' +
      '0V4vfgF90P0VezRD+6bzsR45nPU+RUgRSFI6K8e1i8M3rlmBoo+KFZupFw==\n'     +
      '-----END PUBLIC KEY-----\n'
  },
]

let x25519: KeyPairPemString[] = [
  {
    algName: "X25519",
    priKey:
      '-----BEGIN PRIVATE KEY-----\n'                                      +
      'MC4CAQAwBQYDK2VuBCIEIPh+5Va7DnSrnOz2sB/i3QtrbxCaU3KB5iceDUqwOdRb\n' +
      '-----END PRIVATE KEY-----\n',
    pubKey:
      '-----BEGIN PUBLIC KEY-----\n'                                       +
      'MCowBQYDK2VuAyEAdH3HWDLWDRahg+SNI/NtDMizPgZw1vHnEyksi369SAA=\n'     +
      '-----END PUBLIC KEY-----\n'
  },
]

let ed25519: KeyPairPemString[] = [
  {
    algName: "Ed25519",
    priKey:
      '-----BEGIN PRIVATE KEY-----\n'                                      +
      'MC4CAQAwBQYDK2VwBCIEIDI30tFVtMJV0Nvpud/BQJws0USlfFT8Xd8dFaYVpyiz\n' +
      '-----END PRIVATE KEY-----\n',
    pubKey:
      '-----BEGIN PUBLIC KEY-----\n'                                       +
      'MCowBQYDK2VwAyEAWAlWCqDAxVVryhc5N4HUpB6WkqOF2uQ31cC192FgYH8=\n'     +
      '-----END PUBLIC KEY-----\n'                                         +
      '-----BEGIN CERTIFICATE-----\n'                                      +
      'MIIBtTCCAWegAwIBAgIUepr6myWD4lEKlAETgX0o6GsD+GYwBQYDK2VwMFAxCzAJ\n' +
      'BgNVBAYTAkNOMRAwDgYDVQQIDAdzaGFuZ3hpMQ0wCwYDVQQHDAR4aWFuMQ0wCwYD\n' +
      'VQQKDAR0ZXN0MREwDwYDVQQDDAhjZXJ0dGVzdDAeFw0yNDA4MTIxNDMwMDlaFw0y\n' +
      'NDA5MTExNDMwMDlaMFAxCzAJBgNVBAYTAkNOMRAwDgYDVQQIDAdzaGFuZ3hpMQ0w\n' +
      'CwYDVQQHDAR4aWFuMQ0wCwYDVQQKDAR0ZXN0MREwDwYDVQQDDAhjZXJ0dGVzdDAq\n' +
      'MAUGAytlcAMhAFgJVgqgwMVVa8oXOTeB1KQelpKjhdrkN9XAtfdhYGB/o1MwUTAd\n' +
      'BgNVHQ4EFgQU/CdAEBzB0tzEF96anSLR6qd9crQwHwYDVR0jBBgwFoAU/CdAEBzB\n' +
      '0tzEF96anSLR6qd9crQwDwYDVR0TAQH/BAUwAwEB/zAFBgMrZXADQQBKvTboYXfc\n' +
      'q9rsJGD/ywP/WZUN4+5XBVX8kJZLehAo5ZVRveNbeHQOYO4ujjYopDq/oYMyeSEK\n' +
      '3pr30mpJnTsG\n'                                                     +
      '-----END CERTIFICATE-----\n'
  },
  {
    algName: "Ed25519",
    priKey:
      '-----BEGIN PRIVATE KEY-----\n'                                      +
      'MC4CAQAwBQYDK2VwBCIEIIis7xRYQqJMzprTH7swh+cdzb+ZSDcAyno0mWK/HFv9\n' +
      '-----END PRIVATE KEY-----\n',
    pubKey:
      '-----BEGIN PUBLIC KEY-----\n'                                       +
      'MCowBQYDK2VwAyEAmHTqkNJ2cnJf/27gSgGtH2LzUuXpFjxEr2bcA0xAzyM=\n'     +
      '-----END PUBLIC KEY-----\n'
  },
]

let dsa: KeyPairPemString[] = [
  {
    algName: "DSA1024",
    priKey:
      '-----BEGIN PRIVATE KEY-----\n'                                      +
      'MIIBSwIBADCCASsGByqGSM44BAEwggEeAoGBANdaKLgz0spoF+aH4HbSRWaTlgOo\n' +
      'd2OguqquAQg9jTfXxqhO9vRiIOG2srl+zUEDuWUROKj6qiJ3o4U/TZhR6C4NGckI\n' +
      'h+G4fzFj4Ga1TlPr+3bIDuUJD5/5k8Je4tpxRPai1koce6DZrY4zmM22IdLGl5Uw\n' +
      'h1eXCgpoXI8A0CCXAhUAjJCO/9KIgEhDLIcqoOLoL11Md/UCgYABIf5VzvpImxjt\n' +
      '0bUi+PrEt/DAUDfA1ifF5xtEqOJEfdRPmeuZS4Q213ttGWkwggWsBK9wD6DA94dK\n' +
      'LXvQ4vtIDVq0RzsIVh/dOMhxqtSNwffUbeTU3+VVCEoPJyjrM/Sv1KI9BZmawy3M\n' +
      'dSFjld+Sgi8JBKvwlOpA42wXpruozQQXAhUAi5fhnm7ZKDylasRuP9ugirG4hw0=\n' +
      '-----END PRIVATE KEY-----\n',
    pubKey:
      '-----BEGIN PUBLIC KEY-----\n'                                       +
      'MIIBtzCCASsGByqGSM44BAEwggEeAoGBANdaKLgz0spoF+aH4HbSRWaTlgOod2Og\n' +
      'uqquAQg9jTfXxqhO9vRiIOG2srl+zUEDuWUROKj6qiJ3o4U/TZhR6C4NGckIh+G4\n' +
      'fzFj4Ga1TlPr+3bIDuUJD5/5k8Je4tpxRPai1koce6DZrY4zmM22IdLGl5Uwh1eX\n' +
      'CgpoXI8A0CCXAhUAjJCO/9KIgEhDLIcqoOLoL11Md/UCgYABIf5VzvpImxjt0bUi\n' +
      '+PrEt/DAUDfA1ifF5xtEqOJEfdRPmeuZS4Q213ttGWkwggWsBK9wD6DA94dKLXvQ\n' +
      '4vtIDVq0RzsIVh/dOMhxqtSNwffUbeTU3+VVCEoPJyjrM/Sv1KI9BZmawy3MdSFj\n' +
      'ld+Sgi8JBKvwlOpA42wXpruozQOBhQACgYEA1DWLVJBjEUGMJqj13QnPkMgImeNy\n' +
      'jcOH66R5ZnOv4vWsCh0QxaEVmC0HNNria+PABGC98ILSYZKZ7H3ZSWivEuwVqZ6s\n' +
      'RdHWydM24wv92bxqOKiyAp/UE8JjkWYMlU68XeHnG22V6qeWdui5+3mJSs99LYaB\n' +
      'fmPc8qKx9W/F/6g=\n'                                                 +
      '-----END PUBLIC KEY-----\n'                                         +
      '-----BEGIN CERTIFICATE-----\n'                                      +
      'MIIDPzCCAvygAwIBAgIUVOg2gm06X7hTXByDd1r996jpeZIwCwYJYIZIAWUDBAMC\n' +
      'MFAxCzAJBgNVBAYTAkNOMRAwDgYDVQQIDAdzaGFuZ3hpMQ0wCwYDVQQHDAR4aWFu\n' +
      'MQ0wCwYDVQQKDAR0ZXN0MREwDwYDVQQDDAhjZXJ0dGVzdDAeFw0yNDA4MTIxNDA5\n' +
      'MDJaFw0yNDA5MTExNDA5MDJaMFAxCzAJBgNVBAYTAkNOMRAwDgYDVQQIDAdzaGFu\n' +
      'Z3hpMQ0wCwYDVQQHDAR4aWFuMQ0wCwYDVQQKDAR0ZXN0MREwDwYDVQQDDAhjZXJ0\n' +
      'dGVzdDCCAbcwggErBgcqhkjOOAQBMIIBHgKBgQDXWii4M9LKaBfmh+B20kVmk5YD\n' +
      'qHdjoLqqrgEIPY0318aoTvb0YiDhtrK5fs1BA7llETio+qoid6OFP02YUeguDRnJ\n' +
      'CIfhuH8xY+BmtU5T6/t2yA7lCQ+f+ZPCXuLacUT2otZKHHug2a2OM5jNtiHSxpeV\n' +
      'MIdXlwoKaFyPANAglwIVAIyQjv/SiIBIQyyHKqDi6C9dTHf1AoGAASH+Vc76SJsY\n' +
      '7dG1Ivj6xLfwwFA3wNYnxecbRKjiRH3UT5nrmUuENtd7bRlpMIIFrASvcA+gwPeH\n' +
      'Si170OL7SA1atEc7CFYf3TjIcarUjcH31G3k1N/lVQhKDyco6zP0r9SiPQWZmsMt\n' +
      'zHUhY5XfkoIvCQSr8JTqQONsF6a7qM0DgYUAAoGBANQ1i1SQYxFBjCao9d0Jz5DI\n' +
      'CJnjco3Dh+ukeWZzr+L1rAodEMWhFZgtBzTa4mvjwARgvfCC0mGSmex92UlorxLs\n' +
      'FamerEXR1snTNuML/dm8ajiosgKf1BPCY5FmDJVOvF3h5xttleqnlnbouft5iUrP\n' +
      'fS2GgX5j3PKisfVvxf+oo1MwUTAdBgNVHQ4EFgQU9aFfKcNUONju4pIey/CvIzxZ\n' +
      'pYEwHwYDVR0jBBgwFoAU9aFfKcNUONju4pIey/CvIzxZpYEwDwYDVR0TAQH/BAUw\n' +
      'AwEB/zALBglghkgBZQMEAwIDMAAwLQIVAIJIDThdg+mpVoWTmZY73KtniRO4AhRB\n' +
      '41NPmg9SkEmbJptd14fedl/ouQ==\n'                                     +
      '-----END CERTIFICATE-----\n'
  },
  {
    algName: "DSA2048",
    priKey:
      '-----BEGIN PRIVATE KEY-----\n'                                      +
      'MIICZgIBADCCAjoGByqGSM44BAEwggItAoIBAQDaxITb9+08bVZehMVK0CYIbe7D\n' +
      'QVkHHjhm663WpKdnQ5zIlx1rfag0gkqKAQ1udQoh3Iy9fs1IpNVE3y/m0mZOUPVT\n' +
      '5Wln6bAqtW6RkH1SEbipzlHvUXEJ2ZeBHugV9jdQCj98KFx21Xy1j6lz4ee081pV\n' +
      'rpFdFpDZeIJGSLck8ZHulVMm6uBpX+tXvdwExOAiserTx4j+h9itoE0gi8RZnnzU\n' +
      'hQgosVWlSWbZCGGXjr0nLdaifoVMjSpXdsHLS/NCX32PwS1oFZ8bUmhTC22hu+7/\n' +
      'w9UoTM9A+T/s/2aFj2NyWBUw3Hieu50gecF6DIUPdjHGMRfqQhD+C7+GLJKRAiEA\n' +
      '59Ml4IsGRCRYv1HELhmM2Z709+NSI114yIiExFQ9CnkCggEBANonKP6tfcSdhwrX\n' +
      'ELWMpA9LuuA+obgmbWqqb7jRONcXy4BuNaqqB6ZnYhWAx1UJRN5MTPu1IfCT6NPB\n' +
      'wb5U00VLtXG2DnGH4q/zVTk0ZBcMpDLlS2LBfAmfEXRvRTSKBvb3znP1Aor6pejo\n' +
      'ElQq1qHynlfDtQgd8zNTBomIIoqdYcIZTmqFIdiF8I02qgGvPHLDTg+Bk88p3XEM\n' +
      '6dkDKPnPPJQyeClvxMOcNwK9RF6NTbeUb6q45RR3a5OFMVbjqw3LWc/PDdZ8G9R3\n' +
      'EHwEcmjlKeIsLVqJP+ZAwv7LB82vxhW3yPdYfuIb+b7W43sUdBz1eDtnDPck8th6\n' +
      'LObs7wEEIwIhALxcr0M5eWpMX/JnttwvF9iOpT6FdnZtWdRh4a+OLRuk\n'         +
      '-----END PRIVATE KEY-----\n',
    pubKey:
      '-----BEGIN PUBLIC KEY-----\n'                                       +
      'MIIDRzCCAjoGByqGSM44BAEwggItAoIBAQDaxITb9+08bVZehMVK0CYIbe7DQVkH\n' +
      'Hjhm663WpKdnQ5zIlx1rfag0gkqKAQ1udQoh3Iy9fs1IpNVE3y/m0mZOUPVT5Wln\n' +
      '6bAqtW6RkH1SEbipzlHvUXEJ2ZeBHugV9jdQCj98KFx21Xy1j6lz4ee081pVrpFd\n' +
      'FpDZeIJGSLck8ZHulVMm6uBpX+tXvdwExOAiserTx4j+h9itoE0gi8RZnnzUhQgo\n' +
      'sVWlSWbZCGGXjr0nLdaifoVMjSpXdsHLS/NCX32PwS1oFZ8bUmhTC22hu+7/w9Uo\n' +
      'TM9A+T/s/2aFj2NyWBUw3Hieu50gecF6DIUPdjHGMRfqQhD+C7+GLJKRAiEA59Ml\n' +
      '4IsGRCRYv1HELhmM2Z709+NSI114yIiExFQ9CnkCggEBANonKP6tfcSdhwrXELWM\n' +
      'pA9LuuA+obgmbWqqb7jRONcXy4BuNaqqB6ZnYhWAx1UJRN5MTPu1IfCT6NPBwb5U\n' +
      '00VLtXG2DnGH4q/zVTk0ZBcMpDLlS2LBfAmfEXRvRTSKBvb3znP1Aor6pejoElQq\n' +
      '1qHynlfDtQgd8zNTBomIIoqdYcIZTmqFIdiF8I02qgGvPHLDTg+Bk88p3XEM6dkD\n' +
      'KPnPPJQyeClvxMOcNwK9RF6NTbeUb6q45RR3a5OFMVbjqw3LWc/PDdZ8G9R3EHwE\n' +
      'cmjlKeIsLVqJP+ZAwv7LB82vxhW3yPdYfuIb+b7W43sUdBz1eDtnDPck8th6LObs\n' +
      '7wEDggEFAAKCAQA1SyQYmrRq2ejIHV1OBDowV6BEiMMTsHEhHSUztH6sx2teshzd\n' +
      'zenUImK1TT9HiHV4YpV/v3J7ouO+t5QoLzy2XPa+Cq+RWwYUP2NseONntAm7aE+g\n' +
      'SvzR3Ckh+lnn2Bj7Jft6BVGPcuwXZbfjc21vZtlgzVWPUZZ1cbp2apvLOiOfeNPQ\n' +
      'FLEqNPfz8z7nDRTTj2yETqs4ZuYq09VKNzTOZcjE+E7FQnka5al9fc6TCJdCLHl6\n' +
      'jIfU5qG25UUEDsqI+einTeLm0m7gwcCnyr2gtqydJ68aaHRnMxIiBauzUM3QvTe1\n' +
      '3Q5agGzkKl0/LFncx/Mi8G4Ia1krRb1zJGj3\n'                             +
      '-----END PUBLIC KEY-----\n'                                         +
      '-----BEGIN CERTIFICATE-----\n'                                      +
      'MIIE5jCCBIygAwIBAgIUdVjLMSr0vVD+DtlveCa2LTuA0zMwCwYJYIZIAWUDBAMC\n' +
      'MFAxCzAJBgNVBAYTAkNOMRAwDgYDVQQIDAdzaGFuZ3hpMQ0wCwYDVQQHDAR4aWFu\n' +
      'MQ0wCwYDVQQKDAR0ZXN0MREwDwYDVQQDDAhjZXJ0dGVzdDAeFw0yNDA4MTIxNDA5\n' +
      'MDJaFw0yNDA5MTExNDA5MDJaMFAxCzAJBgNVBAYTAkNOMRAwDgYDVQQIDAdzaGFu\n' +
      'Z3hpMQ0wCwYDVQQHDAR4aWFuMQ0wCwYDVQQKDAR0ZXN0MREwDwYDVQQDDAhjZXJ0\n' +
      'dGVzdDCCA0cwggI6BgcqhkjOOAQBMIICLQKCAQEA2sSE2/ftPG1WXoTFStAmCG3u\n' +
      'w0FZBx44Zuut1qSnZ0OcyJcda32oNIJKigENbnUKIdyMvX7NSKTVRN8v5tJmTlD1\n' +
      'U+VpZ+mwKrVukZB9UhG4qc5R71FxCdmXgR7oFfY3UAo/fChcdtV8tY+pc+HntPNa\n' +
      'Va6RXRaQ2XiCRki3JPGR7pVTJurgaV/rV73cBMTgIrHq08eI/ofYraBNIIvEWZ58\n' +
      '1IUIKLFVpUlm2Qhhl469Jy3Won6FTI0qV3bBy0vzQl99j8EtaBWfG1JoUwttobvu\n' +
      '/8PVKEzPQPk/7P9mhY9jclgVMNx4nrudIHnBegyFD3YxxjEX6kIQ/gu/hiySkQIh\n' +
      'AOfTJeCLBkQkWL9RxC4ZjNme9PfjUiNdeMiIhMRUPQp5AoIBAQDaJyj+rX3EnYcK\n' +
      '1xC1jKQPS7rgPqG4Jm1qqm+40TjXF8uAbjWqqgemZ2IVgMdVCUTeTEz7tSHwk+jT\n' +
      'wcG+VNNFS7Vxtg5xh+Kv81U5NGQXDKQy5UtiwXwJnxF0b0U0igb2985z9QKK+qXo\n' +
      '6BJUKtah8p5Xw7UIHfMzUwaJiCKKnWHCGU5qhSHYhfCNNqoBrzxyw04PgZPPKd1x\n' +
      'DOnZAyj5zzyUMngpb8TDnDcCvURejU23lG+quOUUd2uThTFW46sNy1nPzw3WfBvU\n' +
      'dxB8BHJo5SniLC1aiT/mQML+ywfNr8YVt8j3WH7iG/m+1uN7FHQc9Xg7Zwz3JPLY\n' +
      'eizm7O8BA4IBBQACggEANUskGJq0atnoyB1dTgQ6MFegRIjDE7BxIR0lM7R+rMdr\n' +
      'XrIc3c3p1CJitU0/R4h1eGKVf79ye6LjvreUKC88tlz2vgqvkVsGFD9jbHjjZ7QJ\n' +
      'u2hPoEr80dwpIfpZ59gY+yX7egVRj3LsF2W343Ntb2bZYM1Vj1GWdXG6dmqbyzoj\n' +
      'n3jT0BSxKjT38/M+5w0U049shE6rOGbmKtPVSjc0zmXIxPhOxUJ5GuWpfX3OkwiX\n' +
      'Qix5eoyH1OahtuVFBA7KiPnop03i5tJu4MHAp8q9oLasnSevGmh0ZzMSIgWrs1DN\n' +
      '0L03td0OWoBs5CpdPyxZ3MfzIvBuCGtZK0W9cyRo96NTMFEwHQYDVR0OBBYEFI9L\n' +
      'swAAhKLJnfb4KBb7P8cnXXfEMB8GA1UdIwQYMBaAFI9LswAAhKLJnfb4KBb7P8cn\n' +
      'XXfEMA8GA1UdEwEB/wQFMAMBAf8wCwYJYIZIAWUDBAMCA0cAMEQCIArBOMGBF748\n' +
      'VhNwHaoEuFDnWaF2IlWiP2HffamJcN36AiB36vmUiH/ZNDBfwgnIK0Ko9PkhtQf6\n' +
      'mw0wusWKaYJiHQ==\n'                                                 +
      '-----END CERTIFICATE-----\n'
  },
  {
    algName: "DSA3072",
    priKey:
      '-----BEGIN PRIVATE KEY-----\n'                                      +
      'MIIDZAIBADCCAzkGByqGSM44BAEwggMsAoIBgQDD3/6MaU/M7Ks4qUyqDfOleXcq\n' +
      'f4k0lXLn+bcyiFqZva44Nl8BOCowTtMbZk/b5GSMUgcXLAMSbYJVmPJyxKaUVSIT\n' +
      'JRbDAvt5kjf68EMyIrQeIa1BJurJuGXVylNL25ehU6BmjHVNco9Dq15XSC8gRbkt\n' +
      'bRqChjnMj7CZb6vCvf7b/sHYqpDFG/dCdSkl/zI51BU3gly6gLupoNZ2yZMnO5wg\n' +
      'Q6VdSmc0+Hpffw/FdnwWE+n0RGXZY7turrCSZbXKwti3E1F7V4CEA0daoHhRz+kX\n' +
      'IRA/hzIrfrQgu9jhroqK6JXmpdq90iIgxF03/ocMHYbnkWUWHvR9+va7mcu+9xJA\n' +
      'mgvZ3X/1VYj+cWBgmZdSD4n81D9NbidsKoLc2WcHTOnf04GVueEpsttJxOVATncW\n' +
      'aUyrLwutgaLswHn2QRhOyeOvSrxkz4r5pxITjAE08LupkuKHiBfm5xxqgjuTRPjN\n' +
      'Vu+85psq8AcyLue2UdyTuL68t/idFMsgSyecQyECIQD3HXO7h/o8ZZ9mpZaVxNtc\n' +
      'G06Cdv6agLvxSQuIsNaR0wKCAYAPDN2Dg9pYVp/lBO/nIqTBz7nPSJWZbpZ2cHG+\n' +
      '0uVxg7ky0j1jgIQHge5asbONFq2Hsu04U0Lu+jXXFNOMqHnbzhIIA5qzgjVpDK93\n' +
      'vJBZuit6kIAcA/f07Yk20zqr5TVHAqB8XAhB0tCho4Vwljsp1AXy50gcd0jgzB1A\n' +
      'AVma06swRyFqHeJ5OU8HZgmZzlViOkNqS9aqWh/OPGPwY0Y+uq9VvOTY8fGH62EU\n' +
      'z8boz+wcC5UCDaghyMWwO2nuVmrc6b5Q8+o1P6P4FX7bt2PYOnSfPu8S6m+oSmbE\n' +
      'EVkiOz7fQayvXFB1ddlsCBRFT7ri3BCfOh5HBdi6AQxdw4BJG9e+Hsqc/xfby3Zf\n' +
      'ujdZPuBoe3Hd79LalTDwhD0bz3c5xn3LG0y0uyuBMK2F5Kv0I3BPrsJdOp/Euhvy\n' +
      'QDPEjyCtRumdhLCIsXJGoKcTAqh2hfXF5BkRsPLgo/rHRcL2zIt63sSq2mmWsjPZ\n' +
      'erNO1M9VN3uplZw0LsFyQSrYpOsEIgIgBJcMT/mLCykUO5/91W5g9twt+t8pb2Ss\n' +
      'iSZiSmqRwIY=\n'                                                     +
      '-----END PRIVATE KEY-----\n',
    pubKey:
      '-----BEGIN PUBLIC KEY-----\n'                                       +
      'MIIExjCCAzkGByqGSM44BAEwggMsAoIBgQDD3/6MaU/M7Ks4qUyqDfOleXcqf4k0\n' +
      'lXLn+bcyiFqZva44Nl8BOCowTtMbZk/b5GSMUgcXLAMSbYJVmPJyxKaUVSITJRbD\n' +
      'Avt5kjf68EMyIrQeIa1BJurJuGXVylNL25ehU6BmjHVNco9Dq15XSC8gRbktbRqC\n' +
      'hjnMj7CZb6vCvf7b/sHYqpDFG/dCdSkl/zI51BU3gly6gLupoNZ2yZMnO5wgQ6Vd\n' +
      'Smc0+Hpffw/FdnwWE+n0RGXZY7turrCSZbXKwti3E1F7V4CEA0daoHhRz+kXIRA/\n' +
      'hzIrfrQgu9jhroqK6JXmpdq90iIgxF03/ocMHYbnkWUWHvR9+va7mcu+9xJAmgvZ\n' +
      '3X/1VYj+cWBgmZdSD4n81D9NbidsKoLc2WcHTOnf04GVueEpsttJxOVATncWaUyr\n' +
      'LwutgaLswHn2QRhOyeOvSrxkz4r5pxITjAE08LupkuKHiBfm5xxqgjuTRPjNVu+8\n' +
      '5psq8AcyLue2UdyTuL68t/idFMsgSyecQyECIQD3HXO7h/o8ZZ9mpZaVxNtcG06C\n' +
      'dv6agLvxSQuIsNaR0wKCAYAPDN2Dg9pYVp/lBO/nIqTBz7nPSJWZbpZ2cHG+0uVx\n' +
      'g7ky0j1jgIQHge5asbONFq2Hsu04U0Lu+jXXFNOMqHnbzhIIA5qzgjVpDK93vJBZ\n' +
      'uit6kIAcA/f07Yk20zqr5TVHAqB8XAhB0tCho4Vwljsp1AXy50gcd0jgzB1AAVma\n' +
      '06swRyFqHeJ5OU8HZgmZzlViOkNqS9aqWh/OPGPwY0Y+uq9VvOTY8fGH62EUz8bo\n' +
      'z+wcC5UCDaghyMWwO2nuVmrc6b5Q8+o1P6P4FX7bt2PYOnSfPu8S6m+oSmbEEVki\n' +
      'Oz7fQayvXFB1ddlsCBRFT7ri3BCfOh5HBdi6AQxdw4BJG9e+Hsqc/xfby3ZfujdZ\n' +
      'PuBoe3Hd79LalTDwhD0bz3c5xn3LG0y0uyuBMK2F5Kv0I3BPrsJdOp/EuhvyQDPE\n' +
      'jyCtRumdhLCIsXJGoKcTAqh2hfXF5BkRsPLgo/rHRcL2zIt63sSq2mmWsjPZerNO\n' +
      '1M9VN3uplZw0LsFyQSrYpOsDggGFAAKCAYBc8fqlvEi2SMR97663/SEK2zCl96LT\n' +
      '3MAMuTo5usr5ozymJSV8pT6SbJLMjNtjKJinniHRoDQBeN6L47sTg7qImK5/5bxF\n' +
      'Wzez+BKQY3c69442O8s6j8CzXyPo7OVlrskpOzojCwTUdhxybee42i8NvEUlGwm2\n' +
      'qaT3ibWXycCNdB6v/ypXertnZT2UQkgIXe3jIvhy+qEQ61w34dvU/hu6GSdGY6vM\n' +
      'TZU7lJphWhlh1XJoqSb2klnPvZ2vAD4HtSd1vTZXq+/AnH9g99IeZ1O9ThAt36XL\n' +
      'zmFSkDGT16P4NUuDygTq+4zdbD0fToSnbnsjT4uqh4k4S7nXVrLqX4tMECgAX0Y/\n' +
      'eqQ9EhO45EbGH1Rbb64NqH7uzGyKYDUot/R+Kf//KBYTeXaNgAv/StbekIL2PElf\n' +
      'wXTxeIF7ruX8S0pMwCQ1awf5lgSYuQwmCb+g/++7NDvuIWglQz/xSU3l+4Nithu/\n' +
      'sZwHwjs6pDSAHV79kEqB3A3+g0EV+AEHj2M=\n'                             +
      '-----END PUBLIC KEY-----\n'                                         +
      '-----BEGIN CERTIFICATE-----\n'                                      +
      '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\n' +
      'MfgiN9qPv90l\n'                                                     +
      '-----END CERTIFICATE-----\n'
  },
  {
    algName: "DSA1024",
    priKey:
      '-----BEGIN PRIVATE KEY-----\n'                                      +
      'MIIBWwIBADCCATQGByqGSM44BAEwggEnAoGBAKszTLEFGoGi6T/u+FnoHZqOKR/a\n' +
      'Tm1ADs0XsEKGFrMrups3zVouveK9lqLhkAnRji80u0RXkqz9STk3hEAh935WHnmC\n' +
      'ldKY3a/X8rw6c8BFq9O3ZaoLoPEK2vw02VIuwi9QOLpdPI0PcKRTZRwLH0HYme6m\n' +
      'UzpAwnd7Vl9DkWwRAh0A3uCKW85t431mK4A3tXL7A0iAdiBVD0Tw6wmfgwKBgQCk\n' +
      'Koi4pP3K1wEwLFqbMyg2KJ9lthP1GsnGftTilf1uYmR0YEXkIw18liXXLFITf5Kf\n' +
      'IbcrUtF7DqYXUol0WD7yLjCbuF46m/U7PcaNXfh21GJS1l7rl17AOuM3aJ9xr3FC\n' +
      'xtBPwCTiCYlVkpOYCy1cqGn8+ghWBtAVGEcjzyusWwQeAhxmySg7uETSAJwbG8X4\n' +
      'cw7ub6PfhYgJfrKEI3Yw\n'                                             +
      '-----END PRIVATE KEY-----\n',
    pubKey:
      '-----BEGIN PUBLIC KEY-----\n'                                       +
      'MIIBtzCCASsGByqGSM44BAEwggEeAoGBANdaKLgz0spoF+aH4HbSRWaTlgOod2Og\n' +
      'uqquAQg9jTfXxqhO9vRiIOG2srl+zUEDuWUROKj6qiJ3o4U/TZhR6C4NGckIh+G4\n' +
      'fzFj4Ga1TlPr+3bIDuUJD5/5k8Je4tpxRPai1koce6DZrY4zmM22IdLGl5Uwh1eX\n' +
      'CgpoXI8A0CCXAhUAjJCO/9KIgEhDLIcqoOLoL11Md/UCgYABIf5VzvpImxjt0bUi\n' +
      '+PrEt/DAUDfA1ifF5xtEqOJEfdRPmeuZS4Q213ttGWkwggWsBK9wD6DA94dKLXvQ\n' +
      '4vtIDVq0RzsIVh/dOMhxqtSNwffUbeTU3+VVCEoPJyjrM/Sv1KI9BZmawy3MdSFj\n' +
      'ld+Sgi8JBKvwlOpA42wXpruozQOBhQACgYEA1DWLVJBjEUGMJqj13QnPkMgImeNy\n' +
      'jcOH66R5ZnOv4vWsCh0QxaEVmC0HNNria+PABGC98ILSYZKZ7H3ZSWivEuwVqZ6s\n' +
      'RdHWydM24wv92bxqOKiyAp/UE8JjkWYMlU68XeHnG22V6qeWdui5+3mJSs99LYaB\n' +
      'fmPc8qKx9W/F/6g=\n'                                                 +
      '-----END PUBLIC KEY-----\n'
  },
  {
    algName: "DSA2048",
    priKey:
      '-----BEGIN PRIVATE KEY-----\n'                                      +
      'MIICXAIBADCCAjUGByqGSM44BAEwggIoAoIBAQCTQpPC0XKDO8Gl6AQWHeUtcK0K\n' +
      'k06VEGrsM9kql5QTGlw0kgxWJ/OEHnwYnjoWlrfpm2OFwEYQrMOxL7g7bB3W5VPW\n' +
      'mCF+lYxm1Q60ZENVA5D2qyGlfTEeggqid8lvMs5sE52TJJPBTzUTb8+jS+HM3Jez\n' +
      'fxNPcg0YVJfQP7IKIVzMo6zgtAVRbYqwNMMvEt5sVaAgnZVxeyHyDZFpfuEkFIOw\n' +
      'tFJ5ZR0K79eNBGPOji1qAsUp4r2Ps+V2Zhku+eO4Ts2dwjtDAX0oNEXFRQlo0l7E\n' +
      'jPEt7eloJWccPh+Yuj688HfpHrFve3xKHA6XL2k8pjMsKUjftJ4/iFCOVXXTAh0A\n' +
      'm43NQ9rnaVQuRTL2lYgYz7E3xTKgln+N14eyzQKCAQAoZROu+D0rzK9MxO9+I4sX\n' +
      'RJ6gHtcJfy0FRY1+tRArB5lh0kuzpo/hL3WPthlQIpzpyD2g84iw2KqEKgOu12t9\n' +
      '/gITgWwcSzxxqa6xyuZv2vcMdHoJX5nCBLBv9rimTSKk9gpLIrai8ZJHN5ZgxS42\n' +
      'de01aujOLRGEou2zbj2OzGXC3uO+Meir9Y1s0GDX4NI2lgJENvho1e9kHRdCuIFJ\n' +
      'JkwaX953j0Gi0MXuegQ3xRLzZEQSWQx2lqLHDTL19q50elA0XXv46p5asH0/HfYA\n' +
      'jAiH7knH7zMybYxU4o3b8U/9qGO/qcvUsCIAAfXprCurgrnb4tTpu8a6o4itH63P\n' +
      'BB4CHEbjxeajc9r/ZhySyTLsUqOTR019wNVZ2fJdNiE=\n'                     +
      '-----END PRIVATE KEY-----\n',
    pubKey:
      '-----BEGIN PUBLIC KEY-----\n'                                       +
      'MIIDRzCCAjoGByqGSM44BAEwggItAoIBAQDaxITb9+08bVZehMVK0CYIbe7DQVkH\n' +
      'Hjhm663WpKdnQ5zIlx1rfag0gkqKAQ1udQoh3Iy9fs1IpNVE3y/m0mZOUPVT5Wln\n' +
      '6bAqtW6RkH1SEbipzlHvUXEJ2ZeBHugV9jdQCj98KFx21Xy1j6lz4ee081pVrpFd\n' +
      'FpDZeIJGSLck8ZHulVMm6uBpX+tXvdwExOAiserTx4j+h9itoE0gi8RZnnzUhQgo\n' +
      'sVWlSWbZCGGXjr0nLdaifoVMjSpXdsHLS/NCX32PwS1oFZ8bUmhTC22hu+7/w9Uo\n' +
      'TM9A+T/s/2aFj2NyWBUw3Hieu50gecF6DIUPdjHGMRfqQhD+C7+GLJKRAiEA59Ml\n' +
      '4IsGRCRYv1HELhmM2Z709+NSI114yIiExFQ9CnkCggEBANonKP6tfcSdhwrXELWM\n' +
      'pA9LuuA+obgmbWqqb7jRONcXy4BuNaqqB6ZnYhWAx1UJRN5MTPu1IfCT6NPBwb5U\n' +
      '00VLtXG2DnGH4q/zVTk0ZBcMpDLlS2LBfAmfEXRvRTSKBvb3znP1Aor6pejoElQq\n' +
      '1qHynlfDtQgd8zNTBomIIoqdYcIZTmqFIdiF8I02qgGvPHLDTg+Bk88p3XEM6dkD\n' +
      'KPnPPJQyeClvxMOcNwK9RF6NTbeUb6q45RR3a5OFMVbjqw3LWc/PDdZ8G9R3EHwE\n' +
      'cmjlKeIsLVqJP+ZAwv7LB82vxhW3yPdYfuIb+b7W43sUdBz1eDtnDPck8th6LObs\n' +
      '7wEDggEFAAKCAQA1SyQYmrRq2ejIHV1OBDowV6BEiMMTsHEhHSUztH6sx2teshzd\n' +
      'zenUImK1TT9HiHV4YpV/v3J7ouO+t5QoLzy2XPa+Cq+RWwYUP2NseONntAm7aE+g\n' +
      'SvzR3Ckh+lnn2Bj7Jft6BVGPcuwXZbfjc21vZtlgzVWPUZZ1cbp2apvLOiOfeNPQ\n' +
      'FLEqNPfz8z7nDRTTj2yETqs4ZuYq09VKNzTOZcjE+E7FQnka5al9fc6TCJdCLHl6\n' +
      'jIfU5qG25UUEDsqI+einTeLm0m7gwcCnyr2gtqydJ68aaHRnMxIiBauzUM3QvTe1\n' +
      '3Q5agGzkKl0/LFncx/Mi8G4Ia1krRb1zJGj3\n'                             +
      '-----END PUBLIC KEY-----\n',
  },
  {
    algName: "DSA3072",
    priKey:
      '-----BEGIN PRIVATE KEY-----\n'                                      +
      'MIIDXAIBADCCAzUGByqGSM44BAEwggMoAoIBgQC0jyspAkWMN7wf0q7eWhyqU9nm\n' +
      'VrGueHi5sTSgUhxds466LF1dPKm1GWZT9MrosaOpDjgMl8Q/+CRLJtyvRwSwu2vr\n' +
      'L4K0FKPirpq65v0j7SWgkDlEtg4XtAeXZ6e5mZ4YSpik+iQbxCOqxiloeWCch8fd\n' +
      '0/ag7w85Z7W4GGQNa/dVFIsuMzTVt4KbGuQwl/am0Wz2ZxB9nb01Q62YwjsWhruE\n' +
      '0qAhsUODHgsU8mSl9TXVFkNJEX2DXf9nmXB41DrS8TcNgu9Oozvv8mXeds59Ew0l\n' +
      'Dqf4SFLOaTM/RJZIs/wfxXSFk5IVR1K8JgrQiTVa18Ea3VXu4eJEg3SXa2+DqYPz\n' +
      '1CFy4+8u4czt7BolL5bsBwJ3jqjnWMEQeNu72dhdi8wfD8az2L9KE43SpDm4HRQA\n' +
      'uQeuAYxIqYCAhJ4FkIAxpsRVfA7kwgdaqWmvOIrPDEsW2n8+BbP5X1AeFfROQdeP\n' +
      '9VG93LWOyXb+Xo+fIXgom83P6ugLk0/wTPi4o68CHQCoGJeEGV21yvfmodQZDes0\n' +
      'NQ9HUc/hXjDs+23nAoIBgFyG8PDGB9T7L+RST0TL99F2EgwtnEZ1M40A4XgJOJH9\n' +
      '8BZTUWu3YkRjr82Uw1oSam/N8t4/uazRCwDf2g99dmzXQjGRBe6/vFzB6FIAKq2F\n' +
      'gEl/drKH5GG84PsFY0qjzNBvEDMJg+NxJm0WZ5/cJ0hIt2wSofBcHoG4IQx0PSda\n' +
      'wUAmAfypZ1hRIZ8Rrz8JzyNRcyZ8fEIRREAheaEh83KAFUgSFaFyF2487wFCVu17\n' +
      'PwbWlbs0Qg1bB0QiHnlB2MvQivujXXXwmwtbk+/Sogq/uEBQpFwQFkSicKEURtx5\n' +
      '1KkVQj1//UbSqrvsksYso+AWuZjyUXsQCMY8cBPahx7U4sjTSi3N1zYBXpvj6sQq\n' +
      'MF4OLXzjDc4xf0SkQs50t6gp3TtSOikJ7ITTN3VOcde8lsirkFIshOqWyiQzjn4U\n' +
      'B1kn4hYKaR9FUofiARJpEFAXDSRXjjWOyg3aT8bmVkV2tnoLuHeM2eeINiHLYoX7\n' +
      'ljgMVP006HlMuTlZU0cttwQeAhwjTPlaCEbm0evR0VY4wsgU9ei4IGe64p49FxLo\n' +
      '-----END PRIVATE KEY-----\n',
    pubKey:
      '-----BEGIN PUBLIC KEY-----\n'                                       +
      'MIIExjCCAzkGByqGSM44BAEwggMsAoIBgQDD3/6MaU/M7Ks4qUyqDfOleXcqf4k0\n' +
      'lXLn+bcyiFqZva44Nl8BOCowTtMbZk/b5GSMUgcXLAMSbYJVmPJyxKaUVSITJRbD\n' +
      'Avt5kjf68EMyIrQeIa1BJurJuGXVylNL25ehU6BmjHVNco9Dq15XSC8gRbktbRqC\n' +
      'hjnMj7CZb6vCvf7b/sHYqpDFG/dCdSkl/zI51BU3gly6gLupoNZ2yZMnO5wgQ6Vd\n' +
      'Smc0+Hpffw/FdnwWE+n0RGXZY7turrCSZbXKwti3E1F7V4CEA0daoHhRz+kXIRA/\n' +
      'hzIrfrQgu9jhroqK6JXmpdq90iIgxF03/ocMHYbnkWUWHvR9+va7mcu+9xJAmgvZ\n' +
      '3X/1VYj+cWBgmZdSD4n81D9NbidsKoLc2WcHTOnf04GVueEpsttJxOVATncWaUyr\n' +
      'LwutgaLswHn2QRhOyeOvSrxkz4r5pxITjAE08LupkuKHiBfm5xxqgjuTRPjNVu+8\n' +
      '5psq8AcyLue2UdyTuL68t/idFMsgSyecQyECIQD3HXO7h/o8ZZ9mpZaVxNtcG06C\n' +
      'dv6agLvxSQuIsNaR0wKCAYAPDN2Dg9pYVp/lBO/nIqTBz7nPSJWZbpZ2cHG+0uVx\n' +
      'g7ky0j1jgIQHge5asbONFq2Hsu04U0Lu+jXXFNOMqHnbzhIIA5qzgjVpDK93vJBZ\n' +
      'uit6kIAcA/f07Yk20zqr5TVHAqB8XAhB0tCho4Vwljsp1AXy50gcd0jgzB1AAVma\n' +
      '06swRyFqHeJ5OU8HZgmZzlViOkNqS9aqWh/OPGPwY0Y+uq9VvOTY8fGH62EUz8bo\n' +
      'z+wcC5UCDaghyMWwO2nuVmrc6b5Q8+o1P6P4FX7bt2PYOnSfPu8S6m+oSmbEEVki\n' +
      'Oz7fQayvXFB1ddlsCBRFT7ri3BCfOh5HBdi6AQxdw4BJG9e+Hsqc/xfby3ZfujdZ\n' +
      'PuBoe3Hd79LalTDwhD0bz3c5xn3LG0y0uyuBMK2F5Kv0I3BPrsJdOp/EuhvyQDPE\n' +
      'jyCtRumdhLCIsXJGoKcTAqh2hfXF5BkRsPLgo/rHRcL2zIt63sSq2mmWsjPZerNO\n' +
      '1M9VN3uplZw0LsFyQSrYpOsDggGFAAKCAYBc8fqlvEi2SMR97663/SEK2zCl96LT\n' +
      '3MAMuTo5usr5ozymJSV8pT6SbJLMjNtjKJinniHRoDQBeN6L47sTg7qImK5/5bxF\n' +
      'Wzez+BKQY3c69442O8s6j8CzXyPo7OVlrskpOzojCwTUdhxybee42i8NvEUlGwm2\n' +
      'qaT3ibWXycCNdB6v/ypXertnZT2UQkgIXe3jIvhy+qEQ61w34dvU/hu6GSdGY6vM\n' +
      'TZU7lJphWhlh1XJoqSb2klnPvZ2vAD4HtSd1vTZXq+/AnH9g99IeZ1O9ThAt36XL\n' +
      'zmFSkDGT16P4NUuDygTq+4zdbD0fToSnbnsjT4uqh4k4S7nXVrLqX4tMECgAX0Y/\n' +
      'eqQ9EhO45EbGH1Rbb64NqH7uzGyKYDUot/R+Kf//KBYTeXaNgAv/StbekIL2PElf\n' +
      'wXTxeIF7ruX8S0pMwCQ1awf5lgSYuQwmCb+g/++7NDvuIWglQz/xSU3l+4Nithu/\n' +
      'sZwHwjs6pDSAHV79kEqB3A3+g0EV+AEHj2M=\n'                             +
      '-----END PUBLIC KEY-----\n'
  },
  {
    algName: "DSA1024",
    priKey:
    '-----BEGIN DSA PRIVATE KEY-----\n'                                  +
      'MIIBugIBAAKBgQCsetO2I1i9bkRLi4644YPMTqCJnYdJY9xPjVv8M3HEDB3k2tj7\n' +
      'ErQ+z5OKEJbCA7Fm4jwTVMnssdZ0wG4IQPBSN8JvOwiYq9vmf8jhCGQoUXOEdQHB\n' +
      '8/FZiSJmfAX5OfDFwCAtF/YXd8B0MbGdY6Nb+sv9rKXcBm91C9jvR8e88QIVAIXV\n' +
      '/UEf15NeqPVUsd76sDfH0KObAoGADggbcw1yfUHUa7tPMeAatNnc4iOk2KPqWHLq\n' +
      'PO5CCDOrsRBYzwGXs8IT8hrowTNksY6h9oonpYpyLXKJm+zF/0XM9DrhZsOtNY+L\n' +
      'SS4NLSNRRsahQQIXpAp86wo7c+gdDiofREGnGKo4kj63gy7nwWVDHAcM8bSDYA+r\n' +
      'qXwYI+oCgYAlLfo4GRhOQ8mfYz1XDGsix8PpF2MM05BYXkfBUzxSatjnW7YoKn1d\n' +
      'OGXYeYcSzA0bTwHaSdnRdIVcfsctU2s+ycp0bH6BkkwTWdji9TvYHrVQc8+eObrJ\n' +
      'i6ZfLo4LHe4FhheLo4uXT9GWxT6boq/08+9pMIn515JOTbu+Jb2bQgIUaxIVTstI\n' +
      'V9nI3DL2xR3KNtE63ag=\n'                                             +
      '-----END DSA PRIVATE KEY-----\n',
    pubKey:
    '-----BEGIN PUBLIC KEY-----\n'                                       +
      'MIIBtjCCASsGByqGSM44BAEwggEeAoGBAKx607YjWL1uREuLjrjhg8xOoImdh0lj\n' +
      '3E+NW/wzccQMHeTa2PsStD7Pk4oQlsIDsWbiPBNUyeyx1nTAbghA8FI3wm87CJir\n' +
      '2+Z/yOEIZChRc4R1AcHz8VmJImZ8Bfk58MXAIC0X9hd3wHQxsZ1jo1v6y/2spdwG\n' +
      'b3UL2O9Hx7zxAhUAhdX9QR/Xk16o9VSx3vqwN8fQo5sCgYAOCBtzDXJ9QdRru08x\n' +
      '4Bq02dziI6TYo+pYcuo87kIIM6uxEFjPAZezwhPyGujBM2SxjqH2iielinItcomb\n' +
      '7MX/Rcz0OuFmw601j4tJLg0tI1FGxqFBAhekCnzrCjtz6B0OKh9EQacYqjiSPreD\n' +
      'LufBZUMcBwzxtINgD6upfBgj6gOBhAACgYAlLfo4GRhOQ8mfYz1XDGsix8PpF2MM\n' +
      '05BYXkfBUzxSatjnW7YoKn1dOGXYeYcSzA0bTwHaSdnRdIVcfsctU2s+ycp0bH6B\n' +
      'kkwTWdji9TvYHrVQc8+eObrJi6ZfLo4LHe4FhheLo4uXT9GWxT6boq/08+9pMIn5\n' +
      '15JOTbu+Jb2bQg==\n'                                                 +
      '-----END PUBLIC KEY-----\n'
  },
  {
    algName: "DSA2048",
    priKey:
    '-----BEGIN DSA PRIVATE KEY-----\n'                                  +
      'MIIDVwIBAAKCAQEAs0dGPcHx3KFUZtD5tcnnxfMez/k0HkJSh4kDbC1QYFcx4X4G\n' +
      'WH4SuKpkIlOf8QhQKBKu/DRK8HyVLQyAMNNJ8kIbPGIORll7ZWISKNz13tiB/kxG\n' +
      'YsSTSCa3x5Ygk/S2GC4zE2e11LEiGI1baLiVItx6KzdduA43hDQW9XdWsRMTAnLl\n' +
      'QQ2Zh2GWo5E2QwW9pkhNSgm7yTQP4CisYViGzcYCP8vtZRjseWJRxMIlge+uqDHR\n' +
      'RERH1HX7NGMC6AUanufctkz7BVj3cpPm2JkMnl8mHLKdTRivKfYKbYLVqpfNpmFC\n' +
      'lAlhbhuIEFepuohSGbQApnTLsuBA+0u9cKxRzQIhAN9bBZ3q5SxIbUJO0+q1flaK\n' +
      '4a+Jeea/gM6IKyr5yA37AoIBAAEZ7ZMGjiD7PGeXNHaLmxlqX2ZCx6HxqmtOV6Ek\n' +
      'YDG4o/IJp9J9phbyQ82/0NDEbUVK+gaar7o9TzkWdh0v4wEpw4Q8rQbGH4LJQon3\n' +
      'tgz9qsAbQpdGV4aAIyZVqG8FNL3l/wdTmQfg+SkE12zahUXG90fgxfNLjs8QQnIb\n' +
      'ea/PpT3fqRzZKx8ZdIKglydLDX6q3VMFnM2nUTfD8RMUQmpvj0M3Dgt1m3E06dTz\n' +
      'yD/dJirydeXPomCUZPbbs8whv2Kns7MeX1uAD7GMMeH4k8qwen+TNmHWUMULg+Bp\n' +
      '7A+4BR1lwu4QP6t6WQW/3w5Xr1vB1rURfm9tQijvFbI6QO4CggEBAIpAlgj/n9KO\n' +
      'OydPnOL3YDbwG8zvqxi5K27btFmKfl0sBbomctemMjVyaDATRCdYBWlRWp2pTXKJ\n' +
      'AM7AeH3rrnG0wYRfcOH21NpM5cYtYoW9HDsrG2/TsiKh77PCTCQOyzWn13afXrvT\n' +
      'o94BZ14yhFzviuAQVnfUJxoC4rNgQ3C1tDkPoFP9d58UBi1EUsvBluHtknWcc1pp\n' +
      'jirFM9HveZ5YrfoVFhAVyfW1V5TKhwj1FrBiDR2YkUN6iOPp6Ur6J6ZRNxJMMvC4\n' +
      'gTlYOuChrlDT0REGtFzdsFNjwTbpmjp4szzV6R1oBlMk9CtfmFfZSjKBd90Zlg8X\n' +
      'bVF2Th0pORECIQCCpNewZn8n9U1hCJzJSMSvG4FJKWSKfPEAip59Qg9NxQ==\n'     +
      '-----END DSA PRIVATE KEY-----\n',
    pubKey:
    '-----BEGIN PUBLIC KEY-----\n'                                       +
      'MIIDRzCCAjkGByqGSM44BAEwggIsAoIBAQCzR0Y9wfHcoVRm0Pm1yefF8x7P+TQe\n' +
      'QlKHiQNsLVBgVzHhfgZYfhK4qmQiU5/xCFAoEq78NErwfJUtDIAw00nyQhs8Yg5G\n' +
      'WXtlYhIo3PXe2IH+TEZixJNIJrfHliCT9LYYLjMTZ7XUsSIYjVtouJUi3HorN124\n' +
      'DjeENBb1d1axExMCcuVBDZmHYZajkTZDBb2mSE1KCbvJNA/gKKxhWIbNxgI/y+1l\n' +
      'GOx5YlHEwiWB766oMdFEREfUdfs0YwLoBRqe59y2TPsFWPdyk+bYmQyeXyYcsp1N\n' +
      'GK8p9gptgtWql82mYUKUCWFuG4gQV6m6iFIZtACmdMuy4ED7S71wrFHNAiEA31sF\n' +
      'nerlLEhtQk7T6rV+Vorhr4l55r+AzogrKvnIDfsCggEAARntkwaOIPs8Z5c0doub\n' +
      'GWpfZkLHofGqa05XoSRgMbij8gmn0n2mFvJDzb/Q0MRtRUr6Bpqvuj1PORZ2HS/j\n' +
      'ASnDhDytBsYfgslCife2DP2qwBtCl0ZXhoAjJlWobwU0veX/B1OZB+D5KQTXbNqF\n' +
      'Rcb3R+DF80uOzxBCcht5r8+lPd+pHNkrHxl0gqCXJ0sNfqrdUwWczadRN8PxExRC\n' +
      'am+PQzcOC3WbcTTp1PPIP90mKvJ15c+iYJRk9tuzzCG/Yqezsx5fW4APsYwx4fiT\n' +
      'yrB6f5M2YdZQxQuD4GnsD7gFHWXC7hA/q3pZBb/fDlevW8HWtRF+b21CKO8VsjpA\n' +
      '7gOCAQYAAoIBAQCKQJYI/5/SjjsnT5zi92A28BvM76sYuStu27RZin5dLAW6JnLX\n' +
      'pjI1cmgwE0QnWAVpUVqdqU1yiQDOwHh9665xtMGEX3Dh9tTaTOXGLWKFvRw7Kxtv\n' +
      '07Iioe+zwkwkDss1p9d2n16706PeAWdeMoRc74rgEFZ31CcaAuKzYENwtbQ5D6BT\n' +
      '/XefFAYtRFLLwZbh7ZJ1nHNaaY4qxTPR73meWK36FRYQFcn1tVeUyocI9RawYg0d\n' +
      'mJFDeojj6elK+iemUTcSTDLwuIE5WDrgoa5Q09ERBrRc3bBTY8E26Zo6eLM81ekd\n' +
      'aAZTJPQrX5hX2UoygXfdGZYPF21Rdk4dKTkR\n'                             +
      '-----END PUBLIC KEY-----\n'
  },
  {
    algName: "DSA3072",
    priKey:
    '-----BEGIN DSA PRIVATE KEY-----\n'                                  +
      'MIIE1QIBAAKCAYEAr8Un5zkRFIMWDtJzywmUNZsEunSDc4W3hAdaxWCGNVbOytb7\n' +
      'o1La+UDLSE52AR4pZOpML7oBJsPYzKJcKAu12gWLnDwJoLpy4eBhbr83wUJph+Fn\n' +
      'AdWkJmWef/jTE76ZZey2pyUL5bZB7FW1oOXHiOvPYDX2hF6eHzLqKe36mivjwoZM\n' +
      'nKpHLK2wbUg3ygv/1i7h2zIA0R5OYH7OeXKz/+alxI+K5fsvvJDqCfGztqnI7L1b\n' +
      '6An3YDOy+LRk25Bw9yvM17eAqnBDeNfNyt6Euj2WeR2WE6qpcuRN3yRuUHBUb0Cw\n' +
      'xI1bIcjBBmhfyz3hv69DgPDl+8Wl9P2iDGmNna36sEryuFHQBZiJjPdWBxxzUMtf\n' +
      'zElCMfA7ei9nUXQTxfUI68WsxWUB/jE9n5IKY1MY8H1aAnXsVRVVoA+CoTLNbRtg\n' +
      'd35vkKIgt6vbXRQMVfc9tpAMvjTrR+MMQyMYI1p06Z3djrHW0CtuiH+BuL4ad7jg\n' +
      'gg1M5/3zBnbEfkQ1AiEA+jVyykfPBOJsvdLw6ey+Soc7+jpG0iVARLcQfY/gemcC\n' +
      'ggGAdGDEhgs2LpquE7DS9IqGxhOxOjBH3DZGC6z2AFMPujSXH2JM/t25vQsTWcCr\n' +
      'hH62AdX3gHdfD/7ItyCKvUJEdCgcS/mRTlZFBXl+oarWkKc8AUwbKaB2EEiQbpWH\n' +
      'tzNaPWxnLDv2ofuqs2cQrytxTQ8UnMBcWHWkRuduN7YC7zerhUNBNFVvK7vcgKJO\n' +
      'qGLcwYafO8fu1BL743Am42uZbKxv0f7ovBAiuSwo28RnUL7TFD4ByWB6WganQXT+\n' +
      'DhBWIEHwi7gC1Z+LQsRSz6kwdDoWxZdTtP8euK+IMeNVkM8ZW5GR0ceiJqhpCnR+\n' +
      'zrM//tPKUjWuZg3KBqXRTSTQLLgjhwdGcTTbv2ZyO5B8e17INXlThYNDplEXSfHr\n' +
      'mVcaIyl5h5bZavPlj0IMp6JM2zSFZ8Upumqn1nrNeHPkFJZFNMKK/CFBxDYXQHDR\n' +
      'POW3bNBsGFKfNt/rtlafCH4YekwhkYQi8lze5SUAUThqjES5xAPHtWe+enUjFhJN\n' +
      'QE5TAoIBgHeF5i4zl6LHCyuTWWBfT44tOXwfdUeVMWQY5aJ3/TzIcVAdiVckpEFA\n' +
      'gER5/0VDeRQnGjrtY7hvzE79Gcr7NUoEf9AeJFymWaM9mYIs3YOJ1MJuyXo1GAeB\n' +
      'cewuksGg2ZZW8vTrJNLbMhQjNJJcIl7HCId3PQwxkjvHQypBE2va2r4UTEnS+FZw\n' +
      'wv1IMrp7dbbEngXziIwl5guM/BMe12wI/FmbaxASsdSG0dW5wtJ/iiLLwxRd7Y7L\n' +
      'KZb7muhN/mXOQJ5V0wlBj3Hb0xtFYbAfHuodEZroxEbcwuNdsVxDSm3IPCs1xN9J\n' +
      'yi8jq6I6oqNDt4nMEbQ5va2bk4rTsDbQArNXO50UeO7It30QkXkGM17HXdGp7hK9\n' +
      'ysA3CkRZ+zfxvYYNPk8GuA18Ptbn2YPUOHFU5l/XNXChpGF5xv7Oem9IzEUV+DZU\n' +
      'Hr8o49Gbh+vMogOIoQfZ5DxQJ5KtY5Ibjj8X8/RCxY/pMRseGoBryxSkYsguOk3+\n' +
      'yEiW82DREwIga74yhSh8qL4VDndfoY/F1zAbZKBbNW/bYS/RW6/pkUQ=\n'         +
      '-----END DSA PRIVATE KEY-----\n',
    pubKey:
    '-----BEGIN PUBLIC KEY-----\n'                                       +
      'MIIExjCCAzkGByqGSM44BAEwggMsAoIBgQCvxSfnOREUgxYO0nPLCZQ1mwS6dINz\n' +
      'hbeEB1rFYIY1Vs7K1vujUtr5QMtITnYBHilk6kwvugEmw9jMolwoC7XaBYucPAmg\n' +
      'unLh4GFuvzfBQmmH4WcB1aQmZZ5/+NMTvpll7LanJQvltkHsVbWg5ceI689gNfaE\n' +
      'Xp4fMuop7fqaK+PChkycqkcsrbBtSDfKC//WLuHbMgDRHk5gfs55crP/5qXEj4rl\n' +
      '+y+8kOoJ8bO2qcjsvVvoCfdgM7L4tGTbkHD3K8zXt4CqcEN4183K3oS6PZZ5HZYT\n' +
      'qqly5E3fJG5QcFRvQLDEjVshyMEGaF/LPeG/r0OA8OX7xaX0/aIMaY2drfqwSvK4\n' +
      'UdAFmImM91YHHHNQy1/MSUIx8Dt6L2dRdBPF9QjrxazFZQH+MT2fkgpjUxjwfVoC\n' +
      'dexVFVWgD4KhMs1tG2B3fm+QoiC3q9tdFAxV9z22kAy+NOtH4wxDIxgjWnTpnd2O\n' +
      'sdbQK26If4G4vhp3uOCCDUzn/fMGdsR+RDUCIQD6NXLKR88E4my90vDp7L5Khzv6\n' +
      'OkbSJUBEtxB9j+B6ZwKCAYB0YMSGCzYumq4TsNL0iobGE7E6MEfcNkYLrPYAUw+6\n' +
      'NJcfYkz+3bm9CxNZwKuEfrYB1feAd18P/si3IIq9QkR0KBxL+ZFOVkUFeX6hqtaQ\n' +
      'pzwBTBspoHYQSJBulYe3M1o9bGcsO/ah+6qzZxCvK3FNDxScwFxYdaRG5243tgLv\n' +
      'N6uFQ0E0VW8ru9yAok6oYtzBhp87x+7UEvvjcCbja5lsrG/R/ui8ECK5LCjbxGdQ\n' +
      'vtMUPgHJYHpaBqdBdP4OEFYgQfCLuALVn4tCxFLPqTB0OhbFl1O0/x64r4gx41WQ\n' +
      'zxlbkZHRx6ImqGkKdH7Osz/+08pSNa5mDcoGpdFNJNAsuCOHB0ZxNNu/ZnI7kHx7\n' +
      'Xsg1eVOFg0OmURdJ8euZVxojKXmHltlq8+WPQgynokzbNIVnxSm6aqfWes14c+QU\n' +
      'lkU0wor8IUHENhdAcNE85bds0GwYUp823+u2Vp8Ifhh6TCGRhCLyXN7lJQBROGqM\n' +
      'RLnEA8e1Z756dSMWEk1ATlMDggGFAAKCAYB3heYuM5eixwsrk1lgX0+OLTl8H3VH\n' +
      'lTFkGOWid/08yHFQHYlXJKRBQIBEef9FQ3kUJxo67WO4b8xO/RnK+zVKBH/QHiRc\n' +
      'plmjPZmCLN2DidTCbsl6NRgHgXHsLpLBoNmWVvL06yTS2zIUIzSSXCJexwiHdz0M\n' +
      'MZI7x0MqQRNr2tq+FExJ0vhWcML9SDK6e3W2xJ4F84iMJeYLjPwTHtdsCPxZm2sQ\n' +
      'ErHUhtHVucLSf4oiy8MUXe2OyymW+5roTf5lzkCeVdMJQY9x29MbRWGwHx7qHRGa\n' +
      '6MRG3MLjXbFcQ0ptyDwrNcTfScovI6uiOqKjQ7eJzBG0Ob2tm5OK07A20AKzVzud\n' +
      'FHjuyLd9EJF5BjNex13Rqe4SvcrANwpEWfs38b2GDT5PBrgNfD7W59mD1DhxVOZf\n' +
      '1zVwoaRhecb+znpvSMxFFfg2VB6/KOPRm4frzKIDiKEH2eQ8UCeSrWOSG44/F/P0\n' +
      'QsWP6TEbHhqAa8sUpGLILjpN/shIlvNg0RM=\n'                             +
      '-----END PUBLIC KEY-----\n'
  }
];

class DataBlobMap {
  DSA_ALG_NAME: string     = "DSA";
  X25519_ALG_NAME: string  = "X25519";
  ED25519_ALG_NAME: string = "Ed25519";
  SM2_ALG_NAME: string     = "SM2";
  DH_ALG_NAME: string      = "DH";
  STUB_ALL: string         = "STUB_ALL";

  ECC521_ALG_NAME: string           = "ECC521";
  DSA1024_ALG_NAME: string          = "DSA1024";
  FALSIFIED_HEAD_PEM_DATA: string   = "ECC521_FALSIFIED_HEAD";
  FALSIFIED_TAIL_PEM_DATA: string   = "X25519_FALSIFIED_TAIL";
  PUB_NOT_SATISFIED_BASE64: string  = "PUB_KEY_ERROR";
  PRI_NOT_SATISFIED_BASE64: string  = "PRI_KEY_ERROR";
  NOT_FOUND_PEM_HEAD: string        = "NOT_FOUND_PEM_HEAD";
  NOT_FOUND_PEM_TAIL: string        = "NOT_FOUND_PEM_TAIL";
  PRI_KEY_ENCRYPTED: string         = "PRI_KEY_ENCRYPTED";
  PRI_FALSIFIED_PRIME: string       = "PRI_FALSIFIED_PRIME";
  PRI_FALSIFIED_CURVE_NAME: string  = "PRI_FALSIFIED_CURVE_NAME";
  ECC_160R1: string                 = "ECC_160R1";
  PRI_DEL_PEM_DATA: string          = "PRI_DEL_PEM_DATA";
  PRI_DSA_FALSIFIED_OBJECT: string  = "PRI_DSA_FALSIFIED_OBJECT";
  PRI_FALSIFIED_DATA_TYPE: string   = "PRI_FALSIFIED_DATA_TYPE";
  SM2_FALSIFIED_OBJECT_ONE: string  = "SM2_FALSIFIED_OBJECT_ONE";
  SM2_FALSIFIED_OBJECT_TWO: string  = "SM2_FALSIFIED_OBJECT_TWO";
  PRI_PUB_FROM_DIFF_KEYPAIR: string = "PRI_PUB_FROM_DIFF_KEYPAIR";
  PRI_PUB_FROM_DIFF_ALGO: string    = "PRI_PUB_FROM_DIFF_ALGO";
  FALSIFIED_PRI_ENC_BEGIN: string   = "FALSIFIED_PRI_ENC_BEGIN";
  FALSIFIED_PRI_ENC_ALL: string     = "FALSIFIED_PRI_ENC_ALL";
  GET_PRI_OF_PKCS12_FILE: string    = "GET_PRI_OF_PKCS12_FILE";
  PKCS12: string                    = "PKCS12";
  PKCS7: string                     = "PKCS7";
  PEM_WITH_DIRTY_DATA: string       = "PEM_WITH_DIRTY_DATA";
  PEM_WITH_PKCS8_NOT_PKCS8: string  = "PEM_WITH_PKCS8_NOT_PKCS8";

  keyPairDataPemMap: HashMap<string, KeyPairPemString> = new HashMap<string, KeyPairPemString>();
  keyPairDataPemWithArrayMap: HashMap<string, KeyPairPemString[]> = new HashMap<string, KeyPairPemString[]>();

  constructor(isNull: boolean = true, algName?: string, data?: KeyPairPemString[]) {
    if (algName && data) {
      this.keyPairDataPemWithArrayMap.set(algName, data);
    }
    if (!isNull) {
      this.keyPairDataPemWithArrayMap.set(this.DSA_ALG_NAME, dsa);
      this.keyPairDataPemWithArrayMap.set(this.X25519_ALG_NAME, x25519);
      this.keyPairDataPemWithArrayMap.set(this.ED25519_ALG_NAME, ed25519);
      this.keyPairDataPemWithArrayMap.set(this.SM2_ALG_NAME, sm2);
      this.keyPairDataPemWithArrayMap.set(this.DH_ALG_NAME, dh);
      this.keyPairDataPemWithArrayMap.set(this.STUB_ALL, stub_all);

      this.keyPairDataPemMap.set(this.ECC521_ALG_NAME, ecc521);
      this.keyPairDataPemMap.set(this.DSA1024_ALG_NAME, dsa1024);
      this.keyPairDataPemMap.set(this.FALSIFIED_HEAD_PEM_DATA, ecc521_falsified);
      this.keyPairDataPemMap.set(this.FALSIFIED_TAIL_PEM_DATA, x25519_falsified);
      this.keyPairDataPemMap.set(this.PUB_NOT_SATISFIED_BASE64, ed25519_pub_not_satisfied_base64);
      this.keyPairDataPemMap.set(this.PRI_NOT_SATISFIED_BASE64, ed25519_pri_not_satisfied_base64);
      this.keyPairDataPemMap.set(this.NOT_FOUND_PEM_HEAD, modp1536_pub_not_pem_head);
      this.keyPairDataPemMap.set(this.NOT_FOUND_PEM_TAIL, modp1536_pri_not_pem_tail);
      this.keyPairDataPemMap.set(this.PRI_KEY_ENCRYPTED, ecc224_enc_des3_123456_pri_key);
      this.keyPairDataPemMap.set(this.PRI_FALSIFIED_PRIME, ecc384_falsified_prime);
      this.keyPairDataPemMap.set(this.PRI_FALSIFIED_CURVE_NAME, ecc384_falsified_curve_name);
      this.keyPairDataPemMap.set(this.ECC_160R1, brainpool_p160r1);
      this.keyPairDataPemMap.set(this.PRI_DEL_PEM_DATA, ecc384_pri_del_prime);
      this.keyPairDataPemMap.set(this.PRI_DSA_FALSIFIED_OBJECT, dsa1024_falsified_object);
      this.keyPairDataPemMap.set(this.PRI_FALSIFIED_DATA_TYPE, dh_falsified_data_type);
      this.keyPairDataPemMap.set(this.SM2_FALSIFIED_OBJECT_ONE, sm2_falsified_object_one);
      this.keyPairDataPemMap.set(this.SM2_FALSIFIED_OBJECT_TWO, sm2_falsified_object_two);
      this.keyPairDataPemMap.set(this.PRI_PUB_FROM_DIFF_KEYPAIR, pri_pub_from_different_keypair);
      this.keyPairDataPemMap.set(this.PRI_PUB_FROM_DIFF_ALGO, pri_pub_from_different_algorithm);
      this.keyPairDataPemMap.set(this.FALSIFIED_PRI_ENC_BEGIN, falsified_pem_tag_with_begin);
      this.keyPairDataPemMap.set(this.FALSIFIED_PRI_ENC_ALL, falsified_pem_tag_with_all);
      this.keyPairDataPemMap.set(this.GET_PRI_OF_PKCS12_FILE, pkcs12_get_pri_key);
      this.keyPairDataPemMap.set(this.PKCS12, pkcs12);
      this.keyPairDataPemMap.set(this.PKCS7, pkcs7);
      this.keyPairDataPemMap.set(this.PEM_WITH_DIRTY_DATA, pem_with_dirty_data);
      this.keyPairDataPemMap.set(this.PEM_WITH_PKCS8_NOT_PKCS8, pem_with_pkcs8_not_pkcs8);
    }
  }

  _setData(algName: string, data: KeyPairPemString): void {
    this.keyPairDataPemMap.set(algName, data)
  }

  _setDataWithArray(algName: string, data: KeyPairPemString[]): void {
    this.keyPairDataPemWithArrayMap.set(algName, data)
  }

  getData(algName: string): KeyPairPemString {
    let data: KeyPairPemString = {
      algName: "NULL",
      pubKey: "NULL",
      priKey: "NULL",
    }
    let tmp = this.keyPairDataPemMap.get(algName);
    if (tmp == undefined) {
      return data;
    } else {
      return tmp;
    }
  }

  getDataWithArray(algName: string): KeyPairPemString[] {
    let data: KeyPairPemString[] = [
      {
        algName: "NULL",
        pubKey: "NULL",
        priKey: "NULL",
      }
    ];
    let tmp = this.keyPairDataPemWithArrayMap.get(algName);
    if (tmp == undefined) {
      return data;
    } else {
      return tmp;
    }
  }
}

interface externalData {
  algName: string;
  keyPair: KeyPairPemString[]
}

let externalPemData: externalData[] = [
  {
    algName: "ECC224",
    keyPair: [
      {
        priKey:
          '-----BEGIN PRIVATE KEY-----\n'                                      +
          'MHgCAQAwEAYHKoZIzj0CAQYFK4EEACEEYTBfAgEBBBxNodayUvUCk30qV+/EbiOv\n' +
          '/QhykERrrK6sNMGGoTwDOgAEeqK1zgUiJVo8iu2qD8XyaIKWVo4qJig/DwKpkVOK\n' +
          's3QNNvOAOaPR8wHSoed/MO5zz7QQxFtlZAw=\n'                             +
          '-----END PRIVATE KEY-----\n',
        pubKey:
          '-----BEGIN PUBLIC KEY-----\n'                                       +
          'ME4wEAYHKoZIzj0CAQYFK4EEACEDOgAEeqK1zgUiJVo8iu2qD8XyaIKWVo4qJig/\n' +
          'DwKpkVOKs3QNNvOAOaPR8wHSoed/MO5zz7QQxFtlZAw=\n'                     +
          '-----END PUBLIC KEY-----\n'                                         +
          '-----BEGIN CERTIFICATE-----\n'                                      +
          'MIIB4TCCAZCgAwIBAgIUYT5MyaQubg5pGuG6sWhrnNv+kI4wCgYIKoZIzj0EAwIw\n' +
          'UDELMAkGA1UEBhMCQ04xEDAOBgNVBAgMB3NoYW5neGkxDTALBgNVBAcMBHhpYW4x\n' +
          'DTALBgNVBAoMBHRlc3QxETAPBgNVBAMMCGNlcnR0ZXN0MB4XDTI0MDgxMzAxMjgy\n' +
          'M1oXDTM0MDgxMTAxMjgyM1owUDELMAkGA1UEBhMCQ04xEDAOBgNVBAgMB3NoYW5n\n' +
          'eGkxDTALBgNVBAcMBHhpYW4xDTALBgNVBAoMBHRlc3QxETAPBgNVBAMMCGNlcnR0\n' +
          'ZXN0ME4wEAYHKoZIzj0CAQYFK4EEACEDOgAEeqK1zgUiJVo8iu2qD8XyaIKWVo4q\n' +
          'Jig/DwKpkVOKs3QNNvOAOaPR8wHSoed/MO5zz7QQxFtlZAyjUzBRMB0GA1UdDgQW\n' +
          'BBSBFTMCpum+xINyhekK8tUiMAemBzAfBgNVHSMEGDAWgBSBFTMCpum+xINyhekK\n' +
          '8tUiMAemBzAPBgNVHRMBAf8EBTADAQH/MAoGCCqGSM49BAMCAz8AMDwCHEx0JLAY\n' +
          '7Q9PJLwjIdZY8UvTsb+5Qqxt//QtJVQCHEijaT3WqtIRqdwN/gNFTnSZH1VsSe2Y\n' +
          'kTKHBkk=\n'                                                         +
          '-----END CERTIFICATE-----\n'
      },
      {
        priKey:
          '-----BEGIN EC PRIVATE KEY-----\n'                                   +
          'MGgCAQEEHLaxJPpVSmY/NwJGUJumAU90y/I7AcyIz+QBs5qgBwYFK4EEACGhPAM6\n' +
          'AATaglMxE7K89OCR39K4bypkygR3XEesVYuBaKKZn5C4arWum1hLfRoCSMQokS7u\n' +
          'qzJcTAIRf3jLcg==\n'                                                 +
          '-----END EC PRIVATE KEY-----\n',
        pubKey:
          '-----BEGIN PUBLIC KEY-----\n'                                       +
          'ME4wEAYHKoZIzj0CAQYFK4EEACEDOgAE2oJTMROyvPTgkd/SuG8qZMoEd1xHrFWL\n' +
          'gWiimZ+QuGq1rptYS30aAkjEKJEu7qsyXEwCEX94y3I=\n'                     +
          '-----END PUBLIC KEY-----\n'
      },
      {
        priKey:
          '-----BEGIN PRIVATE KEY-----\n'                                      +
          'MHgCAQAwEAYHKoZIzj0CAQYFK4EEACEEYTBfAgEBBBwG4S0OeZ3qf6Nn1spQJJTt\n' +
          'eVtMXgGNIqeQv3nVoTwDOgAE+IGQSpfmiPvaWwrinnRySYg/NeimiYvzY+j5wnM+\n' +
          'dXy40IDQd/3XVJ+Q7D3brvB1Y7cO/ZmaPtM=\n'                             +
          '-----END PRIVATE KEY-----\n',
        pubKey:
          '-----BEGIN PUBLIC KEY-----\n'                                       +
          'ME4wEAYHKoZIzj0CAQYFK4EEACEDOgAE+IGQSpfmiPvaWwrinnRySYg/NeimiYvz\n' +
          'Y+j5wnM+dXy40IDQd/3XVJ+Q7D3brvB1Y7cO/ZmaPtM=\n'                     +
          '-----END PUBLIC KEY-----\n'
      }
    ]
  },
  {
    algName: "ECC256",
    keyPair: [
      {
        priKey:
          '-----BEGIN PRIVATE KEY-----\n'                                      +
          'MIGHAgEAMBMGByqGSM49AgEGCCqGSM49AwEHBG0wawIBAQQgcrhtDoNL2OheOBRn\n' +
          'Ue/POt266AUY5m13yYAagI8vB6WhRANCAATG7oCo5+oVflc7UFfcFQ851J0UqkbN\n' +
          'QsO+QeN/l4ActAm6IJm8r7J9+JqwZeJkFPGEcpHR+I6+obM2dKbatk5y\n'         +
          '-----END PRIVATE KEY-----\n',
        pubKey:
          '-----BEGIN PUBLIC KEY-----\n'                                       +
          'MFkwEwYHKoZIzj0CAQYIKoZIzj0DAQcDQgAExu6AqOfqFX5XO1BX3BUPOdSdFKpG\n' +
          'zULDvkHjf5eAHLQJuiCZvK+yffiasGXiZBTxhHKR0fiOvqGzNnSm2rZOcg==\n'     +
          '-----END PUBLIC KEY-----\n'                                         +
          '-----BEGIN CERTIFICATE-----\n'                                      +
          'MIIB9jCCAZugAwIBAgIUJy26fqgMLK2E+stNZE5EsOWBPl8wCgYIKoZIzj0EAwIw\n' +
          'UDELMAkGA1UEBhMCQ04xEDAOBgNVBAgMB3NoYW5neGkxDTALBgNVBAcMBHhpYW4x\n' +
          'DTALBgNVBAoMBHRlc3QxETAPBgNVBAMMCGNlcnR0ZXN0MB4XDTI0MDgxMzAxMjgy\n' +
          'M1oXDTM0MDgxMTAxMjgyM1owUDELMAkGA1UEBhMCQ04xEDAOBgNVBAgMB3NoYW5n\n' +
          'eGkxDTALBgNVBAcMBHhpYW4xDTALBgNVBAoMBHRlc3QxETAPBgNVBAMMCGNlcnR0\n' +
          'ZXN0MFkwEwYHKoZIzj0CAQYIKoZIzj0DAQcDQgAExu6AqOfqFX5XO1BX3BUPOdSd\n' +
          'FKpGzULDvkHjf5eAHLQJuiCZvK+yffiasGXiZBTxhHKR0fiOvqGzNnSm2rZOcqNT\n' +
          'MFEwHQYDVR0OBBYEFMbKW8Wkv5y6asx4b9FDCzN9lFGhMB8GA1UdIwQYMBaAFMbK\n' +
          'W8Wkv5y6asx4b9FDCzN9lFGhMA8GA1UdEwEB/wQFMAMBAf8wCgYIKoZIzj0EAwID\n' +
          'SQAwRgIhAOJz1rcznuEKbE2MndqNi7A8zckGQwJG9X3tILJl2MYGAiEAroAxIWLm\n' +
          'Jk1RMGRPT+kjlkwomgW11a5HmDa5xc6taPU=\n'                             +
          '-----END CERTIFICATE-----\n'
      },
      {
        priKey:
          '-----BEGIN EC PRIVATE KEY-----\n'                                   +
          'MHcCAQEEIBC0+PLEtkx7le23i3RI+mhupNLUvjIvd/L1BR9Tr6KqoAoGCCqGSM49\n' +
          'AwEHoUQDQgAEaG+bu2Ior2BLwfmtrMCXwUyT/YRImIhkytuMXz8VBde3gFuMEAko\n' +
          'y84Z8bMW0Z3Vbv6HIGORfRCUc2WYQ1FxBA==\n'                             +
          '-----END EC PRIVATE KEY-----\n',
        pubKey:
          '-----BEGIN PUBLIC KEY-----\n'                                       +
          'MFkwEwYHKoZIzj0CAQYIKoZIzj0DAQcDQgAEaG+bu2Ior2BLwfmtrMCXwUyT/YRI\n' +
          'mIhkytuMXz8VBde3gFuMEAkoy84Z8bMW0Z3Vbv6HIGORfRCUc2WYQ1FxBA==\n'     +
          '-----END PUBLIC KEY-----\n'
      },
      {
        priKey:
          '-----BEGIN PRIVATE KEY-----\n'                                      +
          'MIGHAgEAMBMGByqGSM49AgEGCCqGSM49AwEHBG0wawIBAQQg6GwZ+GSEWijUewRn\n' +
          'aLRhuussHgbsvJiQ0jMRH4nWo0ehRANCAASFVTq+7i9GWSYVXOKvQhZPIuos//e/\n' +
          'FV+ICHivpP/NFIm0OIM5tf3QzQRKsMyY31YlBTKAznHIx6Xfi5vTfVZb\n'         +
          '-----END PRIVATE KEY-----\n',
        pubKey:
          '-----BEGIN PUBLIC KEY-----\n'                                       +
          'MFkwEwYHKoZIzj0CAQYIKoZIzj0DAQcDQgAEhVU6vu4vRlkmFVzir0IWTyLqLP/3\n' +
          'vxVfiAh4r6T/zRSJtDiDObX90M0ESrDMmN9WJQUygM5xyMel34ub031WWw==\n'     +
          '-----END PUBLIC KEY-----\n'
      }
    ]
  },
  {
    algName: "ECC384",
    keyPair: [
      {
        priKey:
          '-----BEGIN PRIVATE KEY-----\n'                                      +
          'MIG2AgEAMBAGByqGSM49AgEGBSuBBAAiBIGeMIGbAgEBBDBpCw1gcOOnvhU4Q3cV\n' +
          'Z3RRZ9VuRf0d/SOQx72UZUa6iP2FWFTfiVuDIm7vr10Zhk6hZANiAARSg6IoTdYq\n' +
          'GI6lCMgw8YHXxt2v3ZMtMWndQvqST5i8SQ8J/2ip1C0g44ZpP1NZVvlYG93D7hpl\n' +
          'oP5HIyOkutf2h29x21+Gj2hHcdFnhJTr/biAoG6RVbqDxglkvMx6tAY=\n'         +
          '-----END PRIVATE KEY-----\n',
        pubKey:
          '-----BEGIN PUBLIC KEY-----\n'                                       +
          'MHYwEAYHKoZIzj0CAQYFK4EEACIDYgAEUoOiKE3WKhiOpQjIMPGB18bdr92TLTFp\n' +
          '3UL6kk+YvEkPCf9oqdQtIOOGaT9TWVb5WBvdw+4aZaD+RyMjpLrX9odvcdtfho9o\n' +
          'R3HRZ4SU6/24gKBukVW6g8YJZLzMerQG\n'                                 +
          '-----END PUBLIC KEY-----\n'                                         +
          '-----BEGIN CERTIFICATE-----\n'                                      +
          'MIICMjCCAbigAwIBAgIUNkXvkscpoxQXz61k26vgK7TuRx4wCgYIKoZIzj0EAwIw\n' +
          'UDELMAkGA1UEBhMCQ04xEDAOBgNVBAgMB3NoYW5neGkxDTALBgNVBAcMBHhpYW4x\n' +
          'DTALBgNVBAoMBHRlc3QxETAPBgNVBAMMCGNlcnR0ZXN0MB4XDTI0MDgxMzAxMjgy\n' +
          'NFoXDTM0MDgxMTAxMjgyNFowUDELMAkGA1UEBhMCQ04xEDAOBgNVBAgMB3NoYW5n\n' +
          'eGkxDTALBgNVBAcMBHhpYW4xDTALBgNVBAoMBHRlc3QxETAPBgNVBAMMCGNlcnR0\n' +
          'ZXN0MHYwEAYHKoZIzj0CAQYFK4EEACIDYgAEUoOiKE3WKhiOpQjIMPGB18bdr92T\n' +
          'LTFp3UL6kk+YvEkPCf9oqdQtIOOGaT9TWVb5WBvdw+4aZaD+RyMjpLrX9odvcdtf\n' +
          'ho9oR3HRZ4SU6/24gKBukVW6g8YJZLzMerQGo1MwUTAdBgNVHQ4EFgQUK9ly1Lqh\n' +
          'z0fRqVGOwA3aJjN8ikMwHwYDVR0jBBgwFoAUK9ly1Lqhz0fRqVGOwA3aJjN8ikMw\n' +
          'DwYDVR0TAQH/BAUwAwEB/zAKBggqhkjOPQQDAgNoADBlAjEAiQkepPP8WmfWZLES\n' +
          '8FBSZ3M7e/kqPhVRjZ9rdAdP4abQfk+5AfwO87Z/MkTfTqPTAjAzfL9shRArKMty\n' +
          'IGvGVWoeqdkduYadeqAFCVK00cEs+3o6NCyfmiDl647Uq28/kTo=\n'             +
          '-----END CERTIFICATE-----\n'
      },
      {
        priKey:
          '-----BEGIN EC PRIVATE KEY-----\n'                                   +
          'MIGkAgEBBDBrrkC+82QluXs+ebkgmMsVH6KW1oNgWUWNDNfyI8UEu6girt6Ic+i1\n' +
          'FERLP2l17JOgBwYFK4EEACKhZANiAAT+s2KCf2CT8T7Tob6Sqrs9/EnMuhYXheFO\n' +
          'lvdjgM6O398GdGsYyqjfyc32RdxHiABy0+uC2GAyWuGUaWyEXf+w0DkKjrb27KDo\n' +
          'XLzL3z8jNGeI/Gz/NsZTakI6bIQgI0g=\n'                                 +
          '-----END EC PRIVATE KEY-----\n',
        pubKey:
          '-----BEGIN PUBLIC KEY-----\n'                                       +
          'MHYwEAYHKoZIzj0CAQYFK4EEACIDYgAE/rNign9gk/E+06G+kqq7PfxJzLoWF4Xh\n' +
          'Tpb3Y4DOjt/fBnRrGMqo38nN9kXcR4gActPrgthgMlrhlGlshF3/sNA5Co629uyg\n' +
          '6Fy8y98/IzRniPxs/zbGU2pCOmyEICNI\n'                                 +
          '-----END PUBLIC KEY-----\n'
      },
      {
        priKey:
          '-----BEGIN PRIVATE KEY-----\n'                                      +
          'MIG2AgEAMBAGByqGSM49AgEGBSuBBAAiBIGeMIGbAgEBBDAuhVbkTq2SMs113MeQ\n' +
          'rzYFnZh35dfSwJp2SbkFwnb2eRlTU3ms/lG00FlkbrEzf1uhZANiAARVWcQCTSqw\n' +
          'oeGKLfTbXbcA8Czf4kPYxzBkdC/gAU9w8P2pAr4hlQq3NHu7Tin1eYgYC92bZpQp\n' +
          'Dmmn7mLZF5AoVnpfVGArclsqXRYk8w+XFR1sduuL31p5j7X3Jmf4Xq4=\n'         +
          '-----END PRIVATE KEY-----\n',
        pubKey:
          '-----BEGIN PUBLIC KEY-----\n'                                       +
          'MHYwEAYHKoZIzj0CAQYFK4EEACIDYgAEVVnEAk0qsKHhii302123APAs3+JD2Mcw\n' +
          'ZHQv4AFPcPD9qQK+IZUKtzR7u04p9XmIGAvdm2aUKQ5pp+5i2ReQKFZ6X1RgK3Jb\n' +
          'Kl0WJPMPlxUdbHbri99aeY+19yZn+F6u\n'                                 +
          '-----END PUBLIC KEY-----\n'
      }
    ]
  },
  {
    algName: "ECC521",
    keyPair: [
      {
        priKey:
          '-----BEGIN PRIVATE KEY-----\n'                                      +
          'MIHuAgEAMBAGByqGSM49AgEGBSuBBAAjBIHWMIHTAgEBBEIBsPiQ2FwDpwCy4MSG\n' +
          's2GTDx3MIfMySmjfnq8R77bbMqI+CsQYgbdg+mMBCry02qmIdPIAc2ZQJlJbUZh7\n' +
          'Ff0uc5mhgYkDgYYABAFexLb5Nrt+mI18KWiJr34PFWWGGDStAl9dgu8rdRLA5Ahn\n' +
          '4yXE5yj9bxYHNpahyAtvgKZlX7KZp2jRktx2EMT7qwEyz7hsh0ZHAfgJr8H1dn5M\n' +
          'Fel65VD8WjYPJrp5kWEdq4Z6DTCRgfditNg+2zFazjMUCvBnYu65xwCq/abDtQ+p\n' +
          'Bw==\n'                                                             +
          '-----END PRIVATE KEY-----\n',
        pubKey:
          '-----BEGIN PUBLIC KEY-----\n'                                       +
          'MIGbMBAGByqGSM49AgEGBSuBBAAjA4GGAAQBXsS2+Ta7fpiNfCloia9+DxVlhhg0\n' +
          'rQJfXYLvK3USwOQIZ+MlxOco/W8WBzaWocgLb4CmZV+ymado0ZLcdhDE+6sBMs+4\n' +
          'bIdGRwH4Ca/B9XZ+TBXpeuVQ/Fo2Dya6eZFhHauGeg0wkYH3YrTYPtsxWs4zFArw\n' +
          'Z2LuuccAqv2mw7UPqQc=\n'                                             +
          '-----END PUBLIC KEY-----\n'                                         +
          '-----BEGIN CERTIFICATE-----\n'                                      +
          'MIICfTCCAd6gAwIBAgIUdt3ISkxTDki11usMLEGzPbUJ4tswCgYIKoZIzj0EAwIw\n' +
          'UDELMAkGA1UEBhMCQ04xEDAOBgNVBAgMB3NoYW5neGkxDTALBgNVBAcMBHhpYW4x\n' +
          'DTALBgNVBAoMBHRlc3QxETAPBgNVBAMMCGNlcnR0ZXN0MB4XDTI0MDgxMzAxMjgy\n' +
          'NFoXDTM0MDgxMTAxMjgyNFowUDELMAkGA1UEBhMCQ04xEDAOBgNVBAgMB3NoYW5n\n' +
          'eGkxDTALBgNVBAcMBHhpYW4xDTALBgNVBAoMBHRlc3QxETAPBgNVBAMMCGNlcnR0\n' +
          'ZXN0MIGbMBAGByqGSM49AgEGBSuBBAAjA4GGAAQBXsS2+Ta7fpiNfCloia9+DxVl\n' +
          'hhg0rQJfXYLvK3USwOQIZ+MlxOco/W8WBzaWocgLb4CmZV+ymado0ZLcdhDE+6sB\n' +
          'Ms+4bIdGRwH4Ca/B9XZ+TBXpeuVQ/Fo2Dya6eZFhHauGeg0wkYH3YrTYPtsxWs4z\n' +
          'FArwZ2LuuccAqv2mw7UPqQejUzBRMB0GA1UdDgQWBBQH1ISDhOyg0/z/uaJGdz8b\n' +
          'STXg6DAfBgNVHSMEGDAWgBQH1ISDhOyg0/z/uaJGdz8bSTXg6DAPBgNVHRMBAf8E\n' +
          'BTADAQH/MAoGCCqGSM49BAMCA4GMADCBiAJCAKAvB886IL+WVrmZ9UbYewmrKt1x\n' +
          'evk4+oZM14hZJQnPvf0bLjXJL66YZYRvBj4YgYT2zlKGvcxZLrhoRV5YiR/yAkIA\n' +
          '2qiDnxgwsQGkp1aBqQVLUOx1+NPvJrzmqn43a7j562i+dQ0g+Cwj2VSnSa1FC8Cl\n' +
          'AUb0O/3LHcvHmxz3CfEZvRE=\n'                                         +
          '-----END CERTIFICATE-----\n'
      },
      {
        priKey:
          '-----BEGIN EC PRIVATE KEY-----\n'                                   +
          'MIHcAgEBBEIBs3SUqyNr1PhXF/0x22PlJPhbRerzyHAU717TSBY6Z+jipgZP0Lrr\n' +
          'sxqyRw+47eBgz0XVpGjVzmCVoRfSixnQ236gBwYFK4EEACOhgYkDgYYABAGaIRiX\n' +
          'yuOEDsgVUllSSPyYd73R4OhfzGK0tPRSMuIUOumUgmzOvX5nX6XLEwmwnMOcVaR4\n' +
          'Cj6B+g6GPquLncKCLAHvRe7KGcLPdAfAru/soI/ywi6+Mgg1/jM8WNxVCplaalS/\n' +
          'feglo4r06ZZbUpqOIubHp+2Nrswwz3dRhYAV217CJw==\n'                     +
          '-----END EC PRIVATE KEY-----\n',
        pubKey:
          '-----BEGIN PUBLIC KEY-----\n'                                       +
          'MIGbMBAGByqGSM49AgEGBSuBBAAjA4GGAAQBmiEYl8rjhA7IFVJZUkj8mHe90eDo\n' +
          'X8xitLT0UjLiFDrplIJszr1+Z1+lyxMJsJzDnFWkeAo+gfoOhj6ri53CgiwB70Xu\n' +
          'yhnCz3QHwK7v7KCP8sIuvjIINf4zPFjcVQqZWmpUv33oJaOK9OmWW1KajiLmx6ft\n' +
          'ja7MMM93UYWAFdtewic=\n'                                             +
          '-----END PUBLIC KEY-----\n'
      },
      {
        priKey:
          '-----BEGIN PRIVATE KEY-----\n'                                      +
          'MIHuAgEAMBAGByqGSM49AgEGBSuBBAAjBIHWMIHTAgEBBEIAmeJHiteXp1EeMSym\n' +
          'QImoph5CghXgF0WmMoqYNeBaiV0DNf8QC7s8wOp2z8LbcvG7lHJI79C+I9nMvyfO\n' +
          'phil+V+hgYkDgYYABAFR2rXLns9Uao1wen9vAj2rFJJ3h3VgUFhqcxvB/5tM2B9H\n' +
          'chcRb5FDKbUBTWDfCIQQ/WRMkqeBkHTmw/rq8oiVUAHD5TJbc3zLKnvlDnPaUiuH\n' +
          'XiTB6+o4MVrB5g/DqcSqp8XRiqeWqtIMepejknj9ZF/yKePBPl/aq+mU8P1Lig/3\n' +
          'bQ==\n'                                                             +
          '-----END PRIVATE KEY-----\n',
        pubKey:
          '-----BEGIN PUBLIC KEY-----\n'                                       +
          'MIGbMBAGByqGSM49AgEGBSuBBAAjA4GGAAQBUdq1y57PVGqNcHp/bwI9qxSSd4d1\n' +
          'YFBYanMbwf+bTNgfR3IXEW+RQym1AU1g3wiEEP1kTJKngZB05sP66vKIlVABw+Uy\n' +
          'W3N8yyp75Q5z2lIrh14kwevqODFaweYPw6nEqqfF0YqnlqrSDHqXo5J4/WRf8inj\n' +
          'wT5f2qvplPD9S4oP920=\n'                                             +
          '-----END PUBLIC KEY-----\n'
      }
    ]
  },
  {
    algName: "ECC_BrainPoolP160r1",
    keyPair: [
      {
        priKey:
          '-----BEGIN PRIVATE KEY-----\n'                                      +
          'MGQCAQAwFAYHKoZIzj0CAQYJKyQDAwIIAQEBBEkwRwIBAQQUO4Uv6i1/166XaFpC\n' +
          'oYWlircP3ImhLAMqAARfVLzoXoRNDsxU9NiuteEm0/8gZtQx81C5GzX3PmAd0Gg8\n' +
          'XM/1FJGi\n'                                                         +
          '-----END PRIVATE KEY-----\n',
        pubKey:
          '-----BEGIN PUBLIC KEY-----\n'                                       +
          'MEIwFAYHKoZIzj0CAQYJKyQDAwIIAQEBAyoABF9UvOhehE0OzFT02K614SbT/yBm\n' +
          '1DHzULkbNfc+YB3QaDxcz/UUkaI=\n'                                     +
          '-----END PUBLIC KEY-----\n'                                         +
          '-----BEGIN CERTIFICATE-----\n'                                      +
          'MIIBxTCCAYSgAwIBAgIUBryRePUcip2ta8SLpTy/+DvWv0kwCgYIKoZIzj0EAwIw\n' +
          'UDELMAkGA1UEBhMCQ04xEDAOBgNVBAgMB3NoYW5neGkxDTALBgNVBAcMBHhpYW4x\n' +
          'DTALBgNVBAoMBHRlc3QxETAPBgNVBAMMCGNlcnR0ZXN0MB4XDTI0MDgxMjEzMjg1\n' +
          'OFoXDTI0MDkxMTEzMjg1OFowUDELMAkGA1UEBhMCQ04xEDAOBgNVBAgMB3NoYW5n\n' +
          'eGkxDTALBgNVBAcMBHhpYW4xDTALBgNVBAoMBHRlc3QxETAPBgNVBAMMCGNlcnR0\n' +
          'ZXN0MEIwFAYHKoZIzj0CAQYJKyQDAwIIAQEBAyoABF9UvOhehE0OzFT02K614SbT\n' +
          '/yBm1DHzULkbNfc+YB3QaDxcz/UUkaKjUzBRMB0GA1UdDgQWBBROHfnHGPsrwKwM\n' +
          'Lk6PLWCc+/e9rzAfBgNVHSMEGDAWgBROHfnHGPsrwKwMLk6PLWCc+/e9rzAPBgNV\n' +
          'HRMBAf8EBTADAQH/MAoGCCqGSM49BAMCAy8AMCwCFFg1SSDW5Q9J1oL7WbwhzJQr\n' +
          'Z4ddAhRSl6X0KsOUeESydO7GP1H9ek8ZKA==\n'                             +
          '-----END CERTIFICATE-----\n'
      },
      {
        priKey:
          '-----BEGIN PRIVATE KEY-----\n'                                      +
          'MGQCAQAwFAYHKoZIzj0CAQYJKyQDAwIIAQEBBEkwRwIBAQQURXNl6qkUHSSFFirk\n' +
          'TsWJ2zwET3ehLAMqAAQbf2b0DnaOsuBabunBQRxUfdPgT1dNyj8VEJwhdUGzvUMc\n' +
          'V541L95Y\n'                                                         +
          '-----END PRIVATE KEY-----\n',
        pubKey:
          '-----BEGIN PUBLIC KEY-----\n'                                       +
          'MEIwFAYHKoZIzj0CAQYJKyQDAwIIAQEBAyoABBt/ZvQOdo6y4Fpu6cFBHFR90+BP\n' +
          'V03KPxUQnCF1QbO9QxxXnjUv3lg=\n'                                     +
          '-----END PUBLIC KEY-----\n'
      }
    ]
  },
  {
    algName: "ECC_BrainPoolP160t1",
    keyPair: [
      {
        priKey:
          '-----BEGIN PRIVATE KEY-----\n'                                      +
          'MGQCAQAwFAYHKoZIzj0CAQYJKyQDAwIIAQECBEkwRwIBAQQUwu13extKyyFZKVHt\n' +
          'xYLTBliQdtmhLAMqAASwX2W4eUFRXry9IWZlmHmfj38S+EGB5HjE3sX9/xmDmshr\n' +
          'EAiBRPH1\n'                                                         +
          '-----END PRIVATE KEY-----\n',
        pubKey:
          '-----BEGIN PUBLIC KEY-----\n'                                       +
          'MEIwFAYHKoZIzj0CAQYJKyQDAwIIAQECAyoABLBfZbh5QVFevL0hZmWYeZ+PfxL4\n' +
          'QYHkeMTexf3/GYOayGsQCIFE8fU=\n'                                     +
          '-----END PUBLIC KEY-----\n'                                         +
          '-----BEGIN CERTIFICATE-----\n'                                      +
          'MIIBxjCCAYSgAwIBAgIULrCwDPsH1UjMiMOdr2cb2OczWTUwCgYIKoZIzj0EAwIw\n' +
          'UDELMAkGA1UEBhMCQ04xEDAOBgNVBAgMB3NoYW5neGkxDTALBgNVBAcMBHhpYW4x\n' +
          'DTALBgNVBAoMBHRlc3QxETAPBgNVBAMMCGNlcnR0ZXN0MB4XDTI0MDgxMjEzMjg1\n' +
          'OFoXDTI0MDkxMTEzMjg1OFowUDELMAkGA1UEBhMCQ04xEDAOBgNVBAgMB3NoYW5n\n' +
          'eGkxDTALBgNVBAcMBHhpYW4xDTALBgNVBAoMBHRlc3QxETAPBgNVBAMMCGNlcnR0\n' +
          'ZXN0MEIwFAYHKoZIzj0CAQYJKyQDAwIIAQECAyoABLBfZbh5QVFevL0hZmWYeZ+P\n' +
          'fxL4QYHkeMTexf3/GYOayGsQCIFE8fWjUzBRMB0GA1UdDgQWBBQv3TOlJ5qIgZLN\n' +
          'fV1TsdFtuzKagTAfBgNVHSMEGDAWgBQv3TOlJ5qIgZLNfV1TsdFtuzKagTAPBgNV\n' +
          'HRMBAf8EBTADAQH/MAoGCCqGSM49BAMCAzAAMC0CFQDXAP0uR+Wm5K8K1CZtzJ6Y\n' +
          'iV4aggIUFXwBHoIB5jiHilWA8iccgtZBRIg=\n'                             +
          '-----END CERTIFICATE-----\n'
      },
      {
        priKey:
          '-----BEGIN PRIVATE KEY-----\n'                                      +
          'MGQCAQAwFAYHKoZIzj0CAQYJKyQDAwIIAQECBEkwRwIBAQQUmuwkYJm9wpf7/OLW\n' +
          'wVnQqPFQ4/yhLAMqAAS6jOMRG0xGNsviRMx0X62XzpKibC9YTMjr8wzhvSzEulkq\n' +
          'DLZnV6yQ\n'                                                         +
          '-----END PRIVATE KEY-----\n',
        pubKey:
          '-----BEGIN PUBLIC KEY-----\n'                                       +
          'MEIwFAYHKoZIzj0CAQYJKyQDAwIIAQECAyoABLqM4xEbTEY2y+JEzHRfrZfOkqJs\n' +
          'L1hMyOvzDOG9LMS6WSoMtmdXrJA=\n'                                     +
          '-----END PUBLIC KEY-----\n'
      },
      {
        priKey:
          '-----BEGIN EC PRIVATE KEY-----\n'                                   +
          'MFQCAQEEFJL97K7u47wR2OB3x1p8N9s68x/2oAsGCSskAwMCCAEBAqEsAyoABAMm\n' +
          'y/UPnqufaoxiwa7onWyw5ApNX6e6y/ISzOYwCvzUM3UTHTqBtng=\n'             +
          '-----END EC PRIVATE KEY-----\n',
        pubKey:
          '-----BEGIN PUBLIC KEY-----\n'                                       +
          'MEIwFAYHKoZIzj0CAQYJKyQDAwIIAQECAyoABAMmy/UPnqufaoxiwa7onWyw5ApN\n' +
          'X6e6y/ISzOYwCvzUM3UTHTqBtng=\n'                                     +
          '-----END PUBLIC KEY-----\n'
      }
    ]
  },
  {
    algName: "ECC_BrainPoolP192r1",
    keyPair: [
      {
        priKey:
          '-----BEGIN PRIVATE KEY-----\n'                                      +
          'MHACAQAwFAYHKoZIzj0CAQYJKyQDAwIIAQEDBFUwUwIBAQQYlHS6kGqTGCePmjQI\n' +
          'Ny7paRHRXYfVT3F0oTQDMgAEKydCzAdafP/xyilNYlNCfPIUEyurkPeqR0SbB3w6\n' +
          'MejHsaEcNKm0RslBV4+a0les\n'                                         +
          '-----END PRIVATE KEY-----\n',
        pubKey:
          '-----BEGIN PUBLIC KEY-----\n'                                       +
          'MEowFAYHKoZIzj0CAQYJKyQDAwIIAQEDAzIABCsnQswHWnz/8copTWJTQnzyFBMr\n' +
          'q5D3qkdEmwd8OjHox7GhHDSptEbJQVePmtJXrA==\n'                         +
          '-----END PUBLIC KEY-----\n'                                         +
          '-----BEGIN CERTIFICATE-----\n'                                      +
          'MIIB1jCCAYygAwIBAgIUAi5DduRtvdzw1KITG9MqirN6FLMwCgYIKoZIzj0EAwIw\n' +
          'UDELMAkGA1UEBhMCQ04xEDAOBgNVBAgMB3NoYW5neGkxDTALBgNVBAcMBHhpYW4x\n' +
          'DTALBgNVBAoMBHRlc3QxETAPBgNVBAMMCGNlcnR0ZXN0MB4XDTI0MDgxMjEzMjg1\n' +
          'OFoXDTI0MDkxMTEzMjg1OFowUDELMAkGA1UEBhMCQ04xEDAOBgNVBAgMB3NoYW5n\n' +
          'eGkxDTALBgNVBAcMBHhpYW4xDTALBgNVBAoMBHRlc3QxETAPBgNVBAMMCGNlcnR0\n' +
          'ZXN0MEowFAYHKoZIzj0CAQYJKyQDAwIIAQEDAzIABCsnQswHWnz/8copTWJTQnzy\n' +
          'FBMrq5D3qkdEmwd8OjHox7GhHDSptEbJQVePmtJXrKNTMFEwHQYDVR0OBBYEFGTE\n' +
          'Pl5q5xeJJzaQhIH9/WY2z1ojMB8GA1UdIwQYMBaAFGTEPl5q5xeJJzaQhIH9/WY2\n' +
          'z1ojMA8GA1UdEwEB/wQFMAMBAf8wCgYIKoZIzj0EAwIDOAAwNQIYDPycCz0hHiDR\n' +
          'fI4Jv6bqlYwgz16Gw4KBAhkArjz0xX5ewOo7EiSKJ2DfuR3rt5IKtZTz\n'         +
          '-----END CERTIFICATE-----\n'
      },
      {
        priKey:
          '-----BEGIN PRIVATE KEY-----\n'                                      +
          'MHACAQAwFAYHKoZIzj0CAQYJKyQDAwIIAQEDBFUwUwIBAQQYAKwX09XM8pjyoKCH\n' +
          'X9AZ9e/FKj0l67dWoTQDMgAETwjokSz2pihQd8jXSzx1IW7UcZU3l+tje315qW9+\n' +
          'Oa/sUDnUDysesgGbrVN9jQn+\n'                                         +
          '-----END PRIVATE KEY-----\n',
        pubKey:
          '-----BEGIN PUBLIC KEY-----\n'                                       +
          'MEowFAYHKoZIzj0CAQYJKyQDAwIIAQEDAzIABE8I6JEs9qYoUHfI10s8dSFu1HGV\n' +
          'N5frY3t9ealvfjmv7FA51A8rHrIBm61TfY0J/g==\n'                         +
          '-----END PUBLIC KEY-----\n'
      },
      {
        priKey:
          '-----BEGIN EC PRIVATE KEY-----\n'                                   +
          'MGACAQEEGFsXs7tRvQK6nFJtj55BMbE15fdHakN38aALBgkrJAMDAggBAQOhNAMy\n' +
          'AAS7kTbs5Bty+1wItd3MhOr1nKLquDxzPc9EiFYmE8V6JwzsR91RG9Qnxew6+7+q\n' +
          'Z7c=\n'                                                             +
          '-----END EC PRIVATE KEY-----\n',
        pubKey:
          '-----BEGIN PUBLIC KEY-----\n'                                       +
          'MEowFAYHKoZIzj0CAQYJKyQDAwIIAQEDAzIABLuRNuzkG3L7XAi13cyE6vWcouq4\n' +
          'PHM9z0SIViYTxXonDOxH3VEb1CfF7Dr7v6pntw==\n'                         +
          '-----END PUBLIC KEY-----\n'
      }
    ]
  },
  {
    algName: "ECC_BrainPoolP192t1",
    keyPair: [
      {
        priKey:
          '-----BEGIN PRIVATE KEY-----\n'                                      +
          'MHACAQAwFAYHKoZIzj0CAQYJKyQDAwIIAQEEBFUwUwIBAQQYUFKRie9wHumkpx3D\n' +
          'Wxuz5mbbOuAwcJXnoTQDMgAEKBLlshZwdHgiX0zaR78byq+bQ4Uje5vCfZFZL4Xk\n' +
          'Kv4hCH1Q6wFY+zxnpIshml6B\n'                                         +
          '-----END PRIVATE KEY-----\n',
        pubKey:
          '-----BEGIN PUBLIC KEY-----\n'                                       +
          'MEowFAYHKoZIzj0CAQYJKyQDAwIIAQEEAzIABCgS5bIWcHR4Il9M2ke/G8qvm0OF\n' +
          'I3ubwn2RWS+F5Cr+IQh9UOsBWPs8Z6SLIZpegQ==\n'                         +
          '-----END PUBLIC KEY-----\n'                                         +
          '-----BEGIN CERTIFICATE-----\n'                                      +
          'MIIB1TCCAYygAwIBAgIUcjT2BxUnC/j/opCGmKhHf69e+2YwCgYIKoZIzj0EAwIw\n' +
          'UDELMAkGA1UEBhMCQ04xEDAOBgNVBAgMB3NoYW5neGkxDTALBgNVBAcMBHhpYW4x\n' +
          'DTALBgNVBAoMBHRlc3QxETAPBgNVBAMMCGNlcnR0ZXN0MB4XDTI0MDgxMjEzMjg1\n' +
          'OFoXDTI0MDkxMTEzMjg1OFowUDELMAkGA1UEBhMCQ04xEDAOBgNVBAgMB3NoYW5n\n' +
          'eGkxDTALBgNVBAcMBHhpYW4xDTALBgNVBAoMBHRlc3QxETAPBgNVBAMMCGNlcnR0\n' +
          'ZXN0MEowFAYHKoZIzj0CAQYJKyQDAwIIAQEEAzIABCgS5bIWcHR4Il9M2ke/G8qv\n' +
          'm0OFI3ubwn2RWS+F5Cr+IQh9UOsBWPs8Z6SLIZpegaNTMFEwHQYDVR0OBBYEFP73\n' +
          'yHvlI1fO7Opiz3ebrIAqyPkyMB8GA1UdIwQYMBaAFP73yHvlI1fO7Opiz3ebrIAq\n' +
          'yPkyMA8GA1UdEwEB/wQFMAMBAf8wCgYIKoZIzj0EAwIDNwAwNAIYbDeYdbeP90rh\n' +
          'BJRka2wX3iik4GqRhNqaAhgNCqUzNUZLBkyy/l3eRt5DUOnvmTbcJlw=\n'         +
          '-----END CERTIFICATE-----\n'
      },
      {
        priKey:
          '-----BEGIN PRIVATE KEY-----\n'                                      +
          'MHACAQAwFAYHKoZIzj0CAQYJKyQDAwIIAQEEBFUwUwIBAQQYWa1tlyjpdfIZuH6L\n' +
          'v+Sh9Qd5WOzjJljOoTQDMgAEsf1Hwmn4PFQ6EhIapl2q6flZrOstMrWpK1MICJvP\n' +
          'mEHi9VDzIUW1lmB7dG2VoEaT\n'                                         +
          '-----END PRIVATE KEY-----\n',
        pubKey:
          '-----BEGIN PUBLIC KEY-----\n'                                       +
          'MEowFAYHKoZIzj0CAQYJKyQDAwIIAQEEAzIABLH9R8Jp+DxUOhISGqZdqun5Wazr\n' +
          'LTK1qStTCAibz5hB4vVQ8yFFtZZge3RtlaBGkw==\n'                         +
          '-----END PUBLIC KEY-----\n'
      },
      {
        priKey:
          '-----BEGIN EC PRIVATE KEY-----\n'                                   +
          'MGACAQEEGJwaG8GBbTWrwmxHTuCJakZDFKsFzy+UQKALBgkrJAMDAggBAQShNAMy\n' +
          'AAQFJwbKsH909/pFLw9DaNAiOXvc88RTnFKXf//5hZDkpjRSjmnr0gtVgj3I3xrC\n' +
          'e0A=\n'                                                             +
          '-----END EC PRIVATE KEY-----\n',
        pubKey:
          '-----BEGIN PUBLIC KEY-----\n'                                       +
          'MEowFAYHKoZIzj0CAQYJKyQDAwIIAQEEAzIABAUnBsqwf3T3+kUvD0No0CI5e9zz\n' +
          'xFOcUpd///mFkOSmNFKOaevSC1WCPcjfGsJ7QA==\n'                         +
          '-----END PUBLIC KEY-----\n'
      }
    ]
  },
  {
    algName: "ECC_BrainPoolP224t1",
    keyPair: [
      {
        priKey:
          '-----BEGIN PRIVATE KEY-----\n'                                      +
          'MHwCAQAwFAYHKoZIzj0CAQYJKyQDAwIIAQEGBGEwXwIBAQQcVWoVJNJfy3cv6c9e\n' +
          'WIM0Lujnnj2XQDALsHR+5aE8AzoABCnbGPQ6FGGGXgatAi9OkEdlDw8c9XjxWsvt\n' +
          'VN295O2f0eWGfj98ksrUtr0bvV6Au9YXR9repkr8\n'                         +
          '-----END PRIVATE KEY-----\n',
        pubKey:
          '-----BEGIN PUBLIC KEY-----\n'                                       +
          'MFIwFAYHKoZIzj0CAQYJKyQDAwIIAQEGAzoABCnbGPQ6FGGGXgatAi9OkEdlDw8c\n' +
          '9XjxWsvtVN295O2f0eWGfj98ksrUtr0bvV6Au9YXR9repkr8\n'                 +
          '-----END PUBLIC KEY-----\n'                                         +
          '-----BEGIN CERTIFICATE-----\n'                                      +
          'MIIB5jCCAZSgAwIBAgIUDjSPj3dNDnSyJtr1AJONBVsyb6QwCgYIKoZIzj0EAwIw\n' +
          'UDELMAkGA1UEBhMCQ04xEDAOBgNVBAgMB3NoYW5neGkxDTALBgNVBAcMBHhpYW4x\n' +
          'DTALBgNVBAoMBHRlc3QxETAPBgNVBAMMCGNlcnR0ZXN0MB4XDTI0MDgxMzAxMjgy\n' +
          'NFoXDTM0MDgxMTAxMjgyNFowUDELMAkGA1UEBhMCQ04xEDAOBgNVBAgMB3NoYW5n\n' +
          'eGkxDTALBgNVBAcMBHhpYW4xDTALBgNVBAoMBHRlc3QxETAPBgNVBAMMCGNlcnR0\n' +
          'ZXN0MFIwFAYHKoZIzj0CAQYJKyQDAwIIAQEGAzoABCnbGPQ6FGGGXgatAi9OkEdl\n' +
          'Dw8c9XjxWsvtVN295O2f0eWGfj98ksrUtr0bvV6Au9YXR9repkr8o1MwUTAdBgNV\n' +
          'HQ4EFgQUCT/rkTUrWlPipniOfn+NaJzPicUwHwYDVR0jBBgwFoAUCT/rkTUrWlPi\n' +
          'pniOfn+NaJzPicUwDwYDVR0TAQH/BAUwAwEB/zAKBggqhkjOPQQDAgNAADA9Ahwt\n' +
          'mL8PkXPoOkFfyIkDaU8brGc9gVPxAsICFg7UAh0Aok/5c/yDQiY3V18jv+QXqJr2\n' +
          'V47CwflAhHXhRQ==\n'                                                 +
          '-----END CERTIFICATE-----\n'
      },
      {
        priKey:
          '-----BEGIN PRIVATE KEY-----\n'                                      +
          'MHwCAQAwFAYHKoZIzj0CAQYJKyQDAwIIAQEGBGEwXwIBAQQcm3miD7RLMHLgWxw1\n' +
          'NWwXalidDAsanJ8+X73uJaE8AzoABNXXAk3Ut9koEHoDc5TvfbkaieikFfoz2pUv\n' +
          'JmkfefaJakRXRpaev3YE9Ke/vl6WxJXo0jbPCe85\n'                         +
          '-----END PRIVATE KEY-----\n',
        pubKey:
          '-----BEGIN PUBLIC KEY-----\n'                                       +
          'MFIwFAYHKoZIzj0CAQYJKyQDAwIIAQEGAzoABNXXAk3Ut9koEHoDc5Tvfbkaieik\n' +
          'Ffoz2pUvJmkfefaJakRXRpaev3YE9Ke/vl6WxJXo0jbPCe85\n'                 +
          '-----END PUBLIC KEY-----\n'
      }
    ]
  },
  {
    algName: "ECC_BrainPoolP224r1",
    keyPair: [
      {
        priKey:
          '-----BEGIN PRIVATE KEY-----\n'                                      +
          'MHwCAQAwFAYHKoZIzj0CAQYJKyQDAwIIAQEFBGEwXwIBAQQceRjy2m/Ez9z04/Xq\n' +
          'VLk5upZ3wfbr8j7pMO7Tm6E8AzoABLEmkwK0tw/4ibGollIXFEedOM7MllPgQdPS\n' +
          '4AM35wnjxkiSDDcNESSjFd43t1o9bXGGcghxLkFj\n'                         +
          '-----END PRIVATE KEY-----\n',
        pubKey:
          '-----BEGIN PUBLIC KEY-----\n'                                       +
          'MFIwFAYHKoZIzj0CAQYJKyQDAwIIAQEFAzoABLEmkwK0tw/4ibGollIXFEedOM7M\n' +
          'llPgQdPS4AM35wnjxkiSDDcNESSjFd43t1o9bXGGcghxLkFj\n'                 +
          '-----END PUBLIC KEY-----\n'                                         +
          '-----BEGIN CERTIFICATE-----\n'                                      +
          'MIIB5TCCAZSgAwIBAgIUOUItKDhZ0jliqMl8gauehIYW2gMwCgYIKoZIzj0EAwIw\n' +
          'UDELMAkGA1UEBhMCQ04xEDAOBgNVBAgMB3NoYW5neGkxDTALBgNVBAcMBHhpYW4x\n' +
          'DTALBgNVBAoMBHRlc3QxETAPBgNVBAMMCGNlcnR0ZXN0MB4XDTI0MDgxMjEzMjg1\n' +
          'OFoXDTI0MDkxMTEzMjg1OFowUDELMAkGA1UEBhMCQ04xEDAOBgNVBAgMB3NoYW5n\n' +
          'eGkxDTALBgNVBAcMBHhpYW4xDTALBgNVBAoMBHRlc3QxETAPBgNVBAMMCGNlcnR0\n' +
          'ZXN0MFIwFAYHKoZIzj0CAQYJKyQDAwIIAQEFAzoABLEmkwK0tw/4ibGollIXFEed\n' +
          'OM7MllPgQdPS4AM35wnjxkiSDDcNESSjFd43t1o9bXGGcghxLkFjo1MwUTAdBgNV\n' +
          'HQ4EFgQUiw+jfq/9pcwlfk+S9+B+3xNJpPYwHwYDVR0jBBgwFoAUiw+jfq/9pcwl\n' +
          'fk+S9+B+3xNJpPYwDwYDVR0TAQH/BAUwAwEB/zAKBggqhkjOPQQDAgM/ADA8Ahw8\n' +
          'yPb7wY8L7UugIaCQ7A7s2STAHy4fcMU1r+YZAhwd3oJlU7akkbiLkPLzUUttQ2Pg\n' +
          'OJbp5LacWEri\n'                                                     +
          '-----END CERTIFICATE-----\n'
      },
      {
        priKey:
          '-----BEGIN PRIVATE KEY-----\n'                                      +
          'MHwCAQAwFAYHKoZIzj0CAQYJKyQDAwIIAQEFBGEwXwIBAQQciwrsVFUauXHJ+LHr\n' +
          'I8OmEqQT4FgXRLLXV132jaE8AzoABMqiqug4+47RWiTfUntrnVJ/H+cUQy6p8QhJ\n' +
          'ZtgBRbnffdJvYrAd96/hiOZKhPBF5m2Z5+0Uid43\n'                         +
          '-----END PRIVATE KEY-----\n',
        pubKey:
          '-----BEGIN PUBLIC KEY-----\n'                                       +
          'MFIwFAYHKoZIzj0CAQYJKyQDAwIIAQEFAzoABMqiqug4+47RWiTfUntrnVJ/H+cU\n' +
          'Qy6p8QhJZtgBRbnffdJvYrAd96/hiOZKhPBF5m2Z5+0Uid43\n'                 +
          '-----END PUBLIC KEY-----\n'
      }
    ]
  },
  {
    algName: "ECC_BrainPoolP256r1",
    keyPair: [
      {
        priKey:
          '-----BEGIN PRIVATE KEY-----\n'                                      +
          'MIGIAgEAMBQGByqGSM49AgEGCSskAwMCCAEBBwRtMGsCAQEEIGn/p90K60k4LH9b\n' +
          'FF3/yZ2D3NzGSbSeMUzygmUpSYbdoUQDQgAEbSPSZ++4cYdElfLyEuGZ4/qGvLq/\n' +
          'nRPaorO+4B/HuE2aIto9qJ1VCTcRvr4K9xk1J5QbMTnsF4/TFLLN4gRkFA==\n'     +
          '-----END PRIVATE KEY-----\n',
        pubKey:
          '-----BEGIN PUBLIC KEY-----\n'                                       +
          'MFowFAYHKoZIzj0CAQYJKyQDAwIIAQEHA0IABG0j0mfvuHGHRJXy8hLhmeP6hry6\n' +
          'v50T2qKzvuAfx7hNmiLaPaidVQk3Eb6+CvcZNSeUGzE57BeP0xSyzeIEZBQ=\n'     +
          '-----END PUBLIC KEY-----\n'                                         +
          '-----BEGIN CERTIFICATE-----\n'                                      +
          'MIIB9TCCAZygAwIBAgIUdE67S0TMOo+2PQ3B6I+0GmJJrwAwCgYIKoZIzj0EAwIw\n' +
          'UDELMAkGA1UEBhMCQ04xEDAOBgNVBAgMB3NoYW5neGkxDTALBgNVBAcMBHhpYW4x\n' +
          'DTALBgNVBAoMBHRlc3QxETAPBgNVBAMMCGNlcnR0ZXN0MB4XDTI0MDgxMzAxMjgy\n' +
          'NFoXDTM0MDgxMTAxMjgyNFowUDELMAkGA1UEBhMCQ04xEDAOBgNVBAgMB3NoYW5n\n' +
          'eGkxDTALBgNVBAcMBHhpYW4xDTALBgNVBAoMBHRlc3QxETAPBgNVBAMMCGNlcnR0\n' +
          'ZXN0MFowFAYHKoZIzj0CAQYJKyQDAwIIAQEHA0IABG0j0mfvuHGHRJXy8hLhmeP6\n' +
          'hry6v50T2qKzvuAfx7hNmiLaPaidVQk3Eb6+CvcZNSeUGzE57BeP0xSyzeIEZBSj\n' +
          'UzBRMB0GA1UdDgQWBBTtHyAUqi8almkSvdcg6Nju/19/FzAfBgNVHSMEGDAWgBTt\n' +
          'HyAUqi8almkSvdcg6Nju/19/FzAPBgNVHRMBAf8EBTADAQH/MAoGCCqGSM49BAMC\n' +
          'A0cAMEQCIFqeQC6XeWieKpK+Py54qCBkW6KC7dox0RyOhgi2kuluAiAM4QiX/VYv\n' +
          'kxqjGCUf8nP806l6CGt/30Q1ZIZ1ydSxrA==\n'                             +
          '-----END CERTIFICATE-----\n'
      },
      {
        priKey:
          '-----BEGIN PRIVATE KEY-----\n'                                      +
          'MIGIAgEAMBQGByqGSM49AgEGCSskAwMCCAEBBwRtMGsCAQEEIHXEIt7DcNC7Qobo\n' +
          'kEvmKSN6yYI1XwfgEDfdrRZ4Cr6toUQDQgAEcI9CURone0iMeeIUTAmxB6VAclLh\n' +
          '3P3rUChuVhkmG+FlpDZI3xsMQacMs9cqXk72KtxzSUkT8oaHFJGUdQ1LgA==\n'     +
          '-----END PRIVATE KEY-----\n',
        pubKey:
          '-----BEGIN PUBLIC KEY-----\n'                                       +
          'MFowFAYHKoZIzj0CAQYJKyQDAwIIAQEHA0IABHCPQlEaJ3tIjHniFEwJsQelQHJS\n' +
          '4dz961AoblYZJhvhZaQ2SN8bDEGnDLPXKl5O9ircc0lJE/KGhxSRlHUNS4A=\n'     +
          '-----END PUBLIC KEY-----\n'
      },
      {
        priKey:
          '-----BEGIN EC PRIVATE KEY-----\n'                                   +
          'MHgCAQEEIAcAGlIugcdbB+yP7QeVhdF2xkyryKGpMNeGm2ZbSC0OoAsGCSskAwMC\n' +
          'CAEBB6FEA0IABA70aIr3qFkZ7qMWOrxX2YondJvP/TqSoLKc//Fj7Eyfi1eoaMIM\n' +
          'U9klUfmM6fRTU6xj+wSYfULlgKFU6fiYuwA=\n'                             +
          '-----END EC PRIVATE KEY-----\n',
        pubKey:
          '-----BEGIN PUBLIC KEY-----\n'                                       +
          'MFowFAYHKoZIzj0CAQYJKyQDAwIIAQEHA0IABA70aIr3qFkZ7qMWOrxX2YondJvP\n' +
          '/TqSoLKc//Fj7Eyfi1eoaMIMU9klUfmM6fRTU6xj+wSYfULlgKFU6fiYuwA=\n'     +
          '-----END PUBLIC KEY-----\n'
      }
    ]
  },
  {
    algName: "ECC_BrainPoolP256t1",
    keyPair: [
      {
        priKey:
          '-----BEGIN PRIVATE KEY-----\n'                                      +
          'MIGIAgEAMBQGByqGSM49AgEGCSskAwMCCAEBCARtMGsCAQEEIJzQidyKwELxnzJF\n' +
          'xAGX1vtZuhZAwS7Z01x6JXtpPBkPoUQDQgAEM1HCqdRE9ePFS+TjtcVwGp0QAY4b\n' +
          'PvP4KjR6leXlNiqH/rBOFDIffTPnfXUXCO6rYiR8GpzHe45Q8/JDwRxfQw==\n'     +
          '-----END PRIVATE KEY-----\n',
        pubKey:
          '-----BEGIN PUBLIC KEY-----\n'                                       +
          'MFowFAYHKoZIzj0CAQYJKyQDAwIIAQEIA0IABDNRwqnURPXjxUvk47XFcBqdEAGO\n' +
          'Gz7z+Co0epXl5TYqh/6wThQyH30z5311Fwjuq2IkfBqcx3uOUPPyQ8EcX0M=\n'     +
          '-----END PUBLIC KEY-----\n'                                         +
          '-----BEGIN CERTIFICATE-----\n'                                      +
          'MIIB9TCCAZygAwIBAgIUF99MxcG1DQbKL2zXee0ROh+N/bswCgYIKoZIzj0EAwIw\n' +
          'UDELMAkGA1UEBhMCQ04xEDAOBgNVBAgMB3NoYW5neGkxDTALBgNVBAcMBHhpYW4x\n' +
          'DTALBgNVBAoMBHRlc3QxETAPBgNVBAMMCGNlcnR0ZXN0MB4XDTI0MDgxMzAxMjgy\n' +
          'NFoXDTM0MDgxMTAxMjgyNFowUDELMAkGA1UEBhMCQ04xEDAOBgNVBAgMB3NoYW5n\n' +
          'eGkxDTALBgNVBAcMBHhpYW4xDTALBgNVBAoMBHRlc3QxETAPBgNVBAMMCGNlcnR0\n' +
          'ZXN0MFowFAYHKoZIzj0CAQYJKyQDAwIIAQEIA0IABDNRwqnURPXjxUvk47XFcBqd\n' +
          'EAGOGz7z+Co0epXl5TYqh/6wThQyH30z5311Fwjuq2IkfBqcx3uOUPPyQ8EcX0Oj\n' +
          'UzBRMB0GA1UdDgQWBBQ5Dxo79IjkAmfv0orede06ThjyDjAfBgNVHSMEGDAWgBQ5\n' +
          'Dxo79IjkAmfv0orede06ThjyDjAPBgNVHRMBAf8EBTADAQH/MAoGCCqGSM49BAMC\n' +
          'A0cAMEQCIDEfIg7/Hj4fpOiBuS4n1mV9Cr5nzM2Lhpe4iYYhWFKaAiAMrwIViDQI\n' +
          'TCEW/R6B9pZhW2jK6phzrOMfIqXceMWKlg==\n'                             +
          '-----END CERTIFICATE-----\n'
      },
      {
        priKey:
          '-----BEGIN PRIVATE KEY-----\n'                                      +
          'MIGIAgEAMBQGByqGSM49AgEGCSskAwMCCAEBCARtMGsCAQEEIE0jv0zTpcyNBALZ\n' +
          'S5iqw+Sp58wiV9n7ooixaCVtXXLaoUQDQgAEl60Rvpvrzvp25eWQuFnGoFazGo/R\n' +
          '+gVHGtrQEUcCv2YBD6kRedl0BFieo3OniWBkw3vV7k8uDma6TA03Sh49rA==\n'     +
          '-----END PRIVATE KEY-----\n',
        pubKey:
          '-----BEGIN PUBLIC KEY-----\n'                                       +
          'MFowFAYHKoZIzj0CAQYJKyQDAwIIAQEIA0IABJetEb6b6876duXlkLhZxqBWsxqP\n' +
          '0foFRxra0BFHAr9mAQ+pEXnZdARYnqNzp4lgZMN71e5PLg5mukwNN0oePaw=\n'     +
          '-----END PUBLIC KEY-----\n'
      },
      {
        priKey:
          '-----BEGIN EC PRIVATE KEY-----\n'                                   +
          'MHgCAQEEIDp+pIkiXFn7p9e3TAvQSNefjA0UsH52/6AA0FLL2ejXoAsGCSskAwMC\n' +
          'CAEBCKFEA0IABHP4n5XjEIW70IOFK48OXJPQRXcz/mhYQcvfikZPhBR/SiPJoMXi\n' +
          't4mIpB4Ami/sGLjmTIX2oQ5ThBdXcWP035M=\n'                             +
          '-----END EC PRIVATE KEY-----\n',
        pubKey:
          '-----BEGIN PUBLIC KEY-----\n'                                       +
          'MFowFAYHKoZIzj0CAQYJKyQDAwIIAQEIA0IABHP4n5XjEIW70IOFK48OXJPQRXcz\n' +
          '/mhYQcvfikZPhBR/SiPJoMXit4mIpB4Ami/sGLjmTIX2oQ5ThBdXcWP035M=\n'     +
          '-----END PUBLIC KEY-----\n'
      }
    ]
  },
  {
    algName: "ECC_BrainPoolP320r1",
    keyPair: [
      {
        priKey:
          '-----BEGIN PRIVATE KEY-----\n'                                      +
          'MIGiAgEAMBQGByqGSM49AgEGCSskAwMCCAEBCQSBhjCBgwIBAQQoaFLitzFIwjpA\n' +
          'oJcMz0TJJJp71iaTwo7ZLNE0ptqDWdBJ2rv743MzZKFUA1IABMD2c/RaQGYN/gLd\n' +
          'kde9/QnEYuPLLBn1u6nxhgOdvyy/5Sata329MxywWWhlalp2lhMYHa6oBaZbpCTR\n' +
          'r27bZlw3mfWwiocfpgFmesje860d\n'                                     +
          '-----END PRIVATE KEY-----\n',
        pubKey:
          '-----BEGIN PUBLIC KEY-----\n'                                       +
          'MGowFAYHKoZIzj0CAQYJKyQDAwIIAQEJA1IABMD2c/RaQGYN/gLdkde9/QnEYuPL\n' +
          'LBn1u6nxhgOdvyy/5Sata329MxywWWhlalp2lhMYHa6oBaZbpCTRr27bZlw3mfWw\n' +
          'iocfpgFmesje860d\n'                                                 +
          '-----END PUBLIC KEY-----\n'                                         +
          '-----BEGIN CERTIFICATE-----\n'                                      +
          'MIICFTCCAaygAwIBAgIUeqBXCoF8TP49x72eVizMqYRDvQAwCgYIKoZIzj0EAwIw\n' +
          'UDELMAkGA1UEBhMCQ04xEDAOBgNVBAgMB3NoYW5neGkxDTALBgNVBAcMBHhpYW4x\n' +
          'DTALBgNVBAoMBHRlc3QxETAPBgNVBAMMCGNlcnR0ZXN0MB4XDTI0MDgxMzAxMjgy\n' +
          'NFoXDTM0MDgxMTAxMjgyNFowUDELMAkGA1UEBhMCQ04xEDAOBgNVBAgMB3NoYW5n\n' +
          'eGkxDTALBgNVBAcMBHhpYW4xDTALBgNVBAoMBHRlc3QxETAPBgNVBAMMCGNlcnR0\n' +
          'ZXN0MGowFAYHKoZIzj0CAQYJKyQDAwIIAQEJA1IABMD2c/RaQGYN/gLdkde9/QnE\n' +
          'YuPLLBn1u6nxhgOdvyy/5Sata329MxywWWhlalp2lhMYHa6oBaZbpCTRr27bZlw3\n' +
          'mfWwiocfpgFmesje860do1MwUTAdBgNVHQ4EFgQUcC7evtTSkPoX0OhhXHDH9Zdl\n' +
          'xhcwHwYDVR0jBBgwFoAUcC7evtTSkPoX0OhhXHDH9ZdlxhcwDwYDVR0TAQH/BAUw\n' +
          'AwEB/zAKBggqhkjOPQQDAgNXADBUAihHReOLqKu/CxOImVWCrXbAsuT/5/ywts5t\n' +
          'D+yGE8OOQwxWw0i9BighAih2Ua/t+NZstWXNJ6nzT5hIWFr22EFVk2ZdX51nQf5G\n' +
          'htOacVDXTL0c\n'                                                     +
          '-----END CERTIFICATE-----\n'
      },
      {
        priKey:
          '-----BEGIN PRIVATE KEY-----\n'                                      +
          'MIGiAgEAMBQGByqGSM49AgEGCSskAwMCCAEBCQSBhjCBgwIBAQQotEbjqRBpqphT\n' +
          'ilRE30zPXLeWnIpU82Rd+wMBNSNx7D65Nh1gG9gYiqFUA1IABGrkPPBytfB91ocF\n' +
          'eOfXwGjGI2PMb1L9zW9lmcwabYZQumITAsfngTURbquNmQGW7szJGFAjxqJ8ysXj\n' +
          'hY8wev74593ocQPuZsISmUEmrZzT\n'                                     +
          '-----END PRIVATE KEY-----\n',
        pubKey:
          '-----BEGIN PUBLIC KEY-----\n'                                       +
          'MGowFAYHKoZIzj0CAQYJKyQDAwIIAQEJA1IABGrkPPBytfB91ocFeOfXwGjGI2PM\n' +
          'b1L9zW9lmcwabYZQumITAsfngTURbquNmQGW7szJGFAjxqJ8ysXjhY8wev74593o\n' +
          'cQPuZsISmUEmrZzT\n'                                                 +
          '-----END PUBLIC KEY-----\n'
      },
      {
        priKey:
          '-----BEGIN EC PRIVATE KEY-----\n'                                   +
          'MIGQAgEBBCimIqAqgPkM0+I/HQTn//DAVHYmXFKe3+gsb87T9ES/Kiz63CwTCDYu\n' +
          'oAsGCSskAwMCCAEBCaFUA1IABKKjzg1eP76ylvTkXe6rApa0qe9Z98UV4mSAIQ6p\n' +
          'ovJSGbVWK/cPY6EZmvX0poK99JCwXAF5u3gGOolkHsYljL8dbBnaqDk1wm5ldJt8\n' +
          'yFuU\n'                                                             +
          '-----END EC PRIVATE KEY-----\n',
        pubKey:
          '-----BEGIN PUBLIC KEY-----\n'                                       +
          'MGowFAYHKoZIzj0CAQYJKyQDAwIIAQEJA1IABKKjzg1eP76ylvTkXe6rApa0qe9Z\n' +
          '98UV4mSAIQ6povJSGbVWK/cPY6EZmvX0poK99JCwXAF5u3gGOolkHsYljL8dbBna\n' +
          'qDk1wm5ldJt8yFuU\n'                                                 +
          '-----END PUBLIC KEY-----\n'
      }
    ]
  },
  {
    algName: "ECC_BrainPoolP320t1",
    keyPair: [
      {
        priKey:
          '-----BEGIN PRIVATE KEY-----\n'                                      +
          'MIGiAgEAMBQGByqGSM49AgEGCSskAwMCCAEBCgSBhjCBgwIBAQQoQIKADjEr6qWn\n' +
          'TA8mVuCRwTGtVY8Vxg5Lbq8iBO/eXf20HqrmVFAWOqFUA1IABEQ9jMCiRWQbRJ7P\n' +
          'MAYkHPssHirav6Tpa6VqMx08aRsquq2nsjd+nqAR0kNt51AiqJo2qEhrlUfw1E8E\n' +
          '1ayeiBGIDAh2taQOnuC6OcbD+kl7\n'                                     +
          '-----END PRIVATE KEY-----\n',
        pubKey:
          '-----BEGIN PUBLIC KEY-----\n'                                       +
          'MGowFAYHKoZIzj0CAQYJKyQDAwIIAQEKA1IABEQ9jMCiRWQbRJ7PMAYkHPssHira\n' +
          'v6Tpa6VqMx08aRsquq2nsjd+nqAR0kNt51AiqJo2qEhrlUfw1E8E1ayeiBGIDAh2\n' +
          'taQOnuC6OcbD+kl7\n'                                                 +
          '-----END PUBLIC KEY-----\n'                                         +
          '-----BEGIN CERTIFICATE-----\n'                                      +
          'MIICFTCCAaygAwIBAgIULwvXET9/hWX1qX3II3xma7372XgwCgYIKoZIzj0EAwIw\n' +
          'UDELMAkGA1UEBhMCQ04xEDAOBgNVBAgMB3NoYW5neGkxDTALBgNVBAcMBHhpYW4x\n' +
          'DTALBgNVBAoMBHRlc3QxETAPBgNVBAMMCGNlcnR0ZXN0MB4XDTI0MDgxMzAxMjgy\n' +
          'NFoXDTM0MDgxMTAxMjgyNFowUDELMAkGA1UEBhMCQ04xEDAOBgNVBAgMB3NoYW5n\n' +
          'eGkxDTALBgNVBAcMBHhpYW4xDTALBgNVBAoMBHRlc3QxETAPBgNVBAMMCGNlcnR0\n' +
          'ZXN0MGowFAYHKoZIzj0CAQYJKyQDAwIIAQEKA1IABEQ9jMCiRWQbRJ7PMAYkHPss\n' +
          'Hirav6Tpa6VqMx08aRsquq2nsjd+nqAR0kNt51AiqJo2qEhrlUfw1E8E1ayeiBGI\n' +
          'DAh2taQOnuC6OcbD+kl7o1MwUTAdBgNVHQ4EFgQUPSz5waQJt+Anbfdiv59uYzCI\n' +
          '2EAwHwYDVR0jBBgwFoAUPSz5waQJt+Anbfdiv59uYzCI2EAwDwYDVR0TAQH/BAUw\n' +
          'AwEB/zAKBggqhkjOPQQDAgNXADBUAigViFVU0szAkl80hgnMdxliSNL5UVuLfxCR\n' +
          'pMxRsrG1JClQviV2FrgIAihfGRSirQ0NrcZjqGsyt7Ysl1sk2OUojrRMhqHTq0f8\n' +
          'cD1thhff9u7D\n'                                                     +
          '-----END CERTIFICATE-----\n'
      },
      {
        priKey:
          '-----BEGIN PRIVATE KEY-----\n'                                      +
          'MIGiAgEAMBQGByqGSM49AgEGCSskAwMCCAEBCgSBhjCBgwIBAQQoOjLMMSFDBo+W\n' +
          'B/7Pnm/Thfo446WGEb4Crht/kBKwLwLMn3BAiPsEaKFUA1IABERpdn7dWsRMnBnK\n' +
          's7aRq5S45XfD42gfkltnPp+pZM3mEqOmSpK2uT1k9XfwEwSoPU4HsQsudOVDOlzk\n' +
          '7Qak9Ss8nYECErFPGSZaVnQ3GfgD\n'                                     +
          '-----END PRIVATE KEY-----\n',
        pubKey:
          '-----BEGIN PUBLIC KEY-----\n'                                       +
          'MGowFAYHKoZIzj0CAQYJKyQDAwIIAQEKA1IABERpdn7dWsRMnBnKs7aRq5S45XfD\n' +
          '42gfkltnPp+pZM3mEqOmSpK2uT1k9XfwEwSoPU4HsQsudOVDOlzk7Qak9Ss8nYEC\n' +
          'ErFPGSZaVnQ3GfgD\n'                                                 +
          '-----END PUBLIC KEY-----\n'
      },
      {
        priKey:
          '-----BEGIN EC PRIVATE KEY-----\n'                                   +
          'MIGQAgEBBCgcW08vyMrfAtuehCYzLlZ/2clfca5LrsQJ3E1tLUEUYielKW+jchvr\n' +
          'oAsGCSskAwMCCAEBCqFUA1IABBW+oQ2YmeT8J/+7xwjWqCshZn5DvIFa0pm56aLD\n' +
          'Dw2YqK1hRH9pyqJUGYiwCKlXNrjF9I8mq8ugFjz7HKGJt3+ULG7kOVg6HyLpA5A5\n' +
          '4op0\n'                                                             +
          '-----END EC PRIVATE KEY-----\n',
        pubKey:
          '-----BEGIN PUBLIC KEY-----\n'                                       +
          'MGowFAYHKoZIzj0CAQYJKyQDAwIIAQEKA1IABBW+oQ2YmeT8J/+7xwjWqCshZn5D\n' +
          'vIFa0pm56aLDDw2YqK1hRH9pyqJUGYiwCKlXNrjF9I8mq8ugFjz7HKGJt3+ULG7k\n' +
          'OVg6HyLpA5A54op0\n'                                                 +
          '-----END PUBLIC KEY-----\n'
      }
    ]
  },
  {
    algName: "ECC_BrainPoolP384r1",
    keyPair: [
      {
        priKey:
          '-----BEGIN PRIVATE KEY-----\n'                                      +
          'MIG6AgEAMBQGByqGSM49AgEGCSskAwMCCAEBCwSBnjCBmwIBAQQwBgdQ1iQ2Efb/\n' +
          'Jnyxjk53nZfmoxJEeHbOvbPydjuKrPsPgdR7j2Xy+cpVFRsReXVloWQDYgAEi4Gh\n' +
          'yPBTm2THqEughl2Lip/y5XaNgoPedbL5HDxJ1Ew+cQZ2JYP+tyXJ+WkZkwNbF4ok\n' +
          '85Tn2bno4WmEiJGUdjrjpGsdqyoNVjhBqhKVGExlYykCQI6yH2vVYKXX2pMc\n'     +
          '-----END PRIVATE KEY-----\n',
        pubKey:
          '-----BEGIN PUBLIC KEY-----\n'                                       +
          'MHowFAYHKoZIzj0CAQYJKyQDAwIIAQELA2IABIuBocjwU5tkx6hLoIZdi4qf8uV2\n' +
          'jYKD3nWy+Rw8SdRMPnEGdiWD/rclyflpGZMDWxeKJPOU59m56OFphIiRlHY646Rr\n' +
          'HasqDVY4QaoSlRhMZWMpAkCOsh9r1WCl19qTHA==\n'                         +
          '-----END PUBLIC KEY-----\n'                                         +
          '-----BEGIN CERTIFICATE-----\n'                                      +
          'MIICNTCCAbygAwIBAgIUdVbl6fRJdiCDeoK5w1Ra3hxZiW4wCgYIKoZIzj0EAwIw\n' +
          'UDELMAkGA1UEBhMCQ04xEDAOBgNVBAgMB3NoYW5neGkxDTALBgNVBAcMBHhpYW4x\n' +
          'DTALBgNVBAoMBHRlc3QxETAPBgNVBAMMCGNlcnR0ZXN0MB4XDTI0MDgxMzAxMjgy\n' +
          'NFoXDTM0MDgxMTAxMjgyNFowUDELMAkGA1UEBhMCQ04xEDAOBgNVBAgMB3NoYW5n\n' +
          'eGkxDTALBgNVBAcMBHhpYW4xDTALBgNVBAoMBHRlc3QxETAPBgNVBAMMCGNlcnR0\n' +
          'ZXN0MHowFAYHKoZIzj0CAQYJKyQDAwIIAQELA2IABIuBocjwU5tkx6hLoIZdi4qf\n' +
          '8uV2jYKD3nWy+Rw8SdRMPnEGdiWD/rclyflpGZMDWxeKJPOU59m56OFphIiRlHY6\n' +
          '46RrHasqDVY4QaoSlRhMZWMpAkCOsh9r1WCl19qTHKNTMFEwHQYDVR0OBBYEFKXj\n' +
          '9sCPSepxR9MTopzExYIxSubRMB8GA1UdIwQYMBaAFKXj9sCPSepxR9MTopzExYIx\n' +
          'SubRMA8GA1UdEwEB/wQFMAMBAf8wCgYIKoZIzj0EAwIDZwAwZAIwdrPbv0EENG9K\n' +
          'OchWXcHdaD+3J7SvPiqGdIiIQggH1nR9fo3KOIBcwKU0KQAqvjvnAjBMAJlPhr+X\n' +
          'mN+tgeZrS9eiahWdKZgEuodLP7py4k2MmjsLE8/P2hTHsIN3cWmy03I=\n'         +
          '-----END CERTIFICATE-----\n'
      },
      {
        priKey:
          '-----BEGIN PRIVATE KEY-----\n'                                      +
          'MIG6AgEAMBQGByqGSM49AgEGCSskAwMCCAEBCwSBnjCBmwIBAQQwYU+d7WW/pnNy\n' +
          'e/lljCo31uyfk7MoVxkyOGN69LRWisw2Cb5hs9kzxZkkAJxNA20LoWQDYgAEFiJL\n' +
          'Zm7hu7so1yqeIJXzqGM/ArTRaiNN4RUGEM8IPo1ZSZk1pTLoZRLY6ZAvBBYBMrIE\n' +
          'kSwCdqY27872wIIICFf636fWw19JPLTkKjlL3rcaQ4KkmpyyKw+lhI/ytRX5\n'     +
          '-----END PRIVATE KEY-----\n',
        pubKey:
          '-----BEGIN PUBLIC KEY-----\n'                                       +
          'MHowFAYHKoZIzj0CAQYJKyQDAwIIAQELA2IABBYiS2Zu4bu7KNcqniCV86hjPwK0\n' +
          '0WojTeEVBhDPCD6NWUmZNaUy6GUS2OmQLwQWATKyBJEsAnamNu/O9sCCCAhX+t+n\n' +
          '1sNfSTy05Co5S963GkOCpJqcsisPpYSP8rUV+Q==\n'                         +
          '-----END PUBLIC KEY-----\n'
      },
      {
        priKey:
          '-----BEGIN EC PRIVATE KEY-----\n'                                   +
          'MIGoAgEBBDBQKgn+K7KmO9aN9fJWizroqXrDXoDSdxV0r6jM5wqvbfO5qhvac23S\n' +
          'uMk6nug3Q4igCwYJKyQDAwIIAQELoWQDYgAEfEnS9WEXzN8v9xufA4J9LL9qCKed\n' +
          'JXEf8U+k2bm+uFUFmXaZG8BBxdmP3ieFX8i/VTwwx0SCUnQxByT2+J1GobJvmuGn\n' +
          'J4THIA1m20mxjku4byVKrZXQ+Qo8lIC1qhaj\n'                             +
          '-----END EC PRIVATE KEY-----\n',
        pubKey:
          '-----BEGIN PUBLIC KEY-----\n'                                       +
          'MHowFAYHKoZIzj0CAQYJKyQDAwIIAQELA2IABHxJ0vVhF8zfL/cbnwOCfSy/agin\n' +
          'nSVxH/FPpNm5vrhVBZl2mRvAQcXZj94nhV/Iv1U8MMdEglJ0MQck9vidRqGyb5rh\n' +
          'pyeExyANZttJsY5LuG8lSq2V0PkKPJSAtaoWow==\n'                         +
          '-----END PUBLIC KEY-----\n'
      }
    ]
  },
  {
    algName: "ECC_BrainPoolP384t1",
    keyPair: [
      {
        priKey:
          '-----BEGIN PRIVATE KEY-----\n'                                      +
          'MIG6AgEAMBQGByqGSM49AgEGCSskAwMCCAEBDASBnjCBmwIBAQQwOs8Pcm0dXQaq\n' +
          'Em/OD1weZyfhaxXHzFN3RZJv+9sEfJGXyWn5Z59j6UfnPtM3F2oWoWQDYgAESRxu\n' +
          'FaH598bLHsTtbJbn0LgUoad53lK/PIubpx3cjJDlnVrzTZO4Gc71jaSsOC5ravKc\n' +
          'vhfIJZa3ACNLwANuGz6nNUHmhv0bR8aKaDQSJYCB7uPE/Dp+c/fcW+KdFOYV\n'     +
          '-----END PRIVATE KEY-----\n',
        pubKey:
          '-----BEGIN PUBLIC KEY-----\n'                                       +
          'MHowFAYHKoZIzj0CAQYJKyQDAwIIAQEMA2IABEkcbhWh+ffGyx7E7WyW59C4FKGn\n' +
          'ed5SvzyLm6cd3IyQ5Z1a802TuBnO9Y2krDgua2rynL4XyCWWtwAjS8ADbhs+pzVB\n' +
          '5ob9G0fGimg0EiWAge7jxPw6fnP33FvinRTmFQ==\n'                         +
          '-----END PUBLIC KEY-----\n'                                         +
          '-----BEGIN CERTIFICATE-----\n'                                      +
          'MIICNjCCAbygAwIBAgIUTDYlsaYddgToo1+vjdsYUl0oJgEwCgYIKoZIzj0EAwIw\n' +
          'UDELMAkGA1UEBhMCQ04xEDAOBgNVBAgMB3NoYW5neGkxDTALBgNVBAcMBHhpYW4x\n' +
          'DTALBgNVBAoMBHRlc3QxETAPBgNVBAMMCGNlcnR0ZXN0MB4XDTI0MDgxMzAxMjgy\n' +
          'NFoXDTM0MDgxMTAxMjgyNFowUDELMAkGA1UEBhMCQ04xEDAOBgNVBAgMB3NoYW5n\n' +
          'eGkxDTALBgNVBAcMBHhpYW4xDTALBgNVBAoMBHRlc3QxETAPBgNVBAMMCGNlcnR0\n' +
          'ZXN0MHowFAYHKoZIzj0CAQYJKyQDAwIIAQEMA2IABEkcbhWh+ffGyx7E7WyW59C4\n' +
          'FKGned5SvzyLm6cd3IyQ5Z1a802TuBnO9Y2krDgua2rynL4XyCWWtwAjS8ADbhs+\n' +
          'pzVB5ob9G0fGimg0EiWAge7jxPw6fnP33FvinRTmFaNTMFEwHQYDVR0OBBYEFAhz\n' +
          '9VpXIgXugUjS8X17V3e5lWloMB8GA1UdIwQYMBaAFAhz9VpXIgXugUjS8X17V3e5\n' +
          'lWloMA8GA1UdEwEB/wQFMAMBAf8wCgYIKoZIzj0EAwIDaAAwZQIxAIjuPPv1LYPK\n' +
          'HhIgGbc2mFD8mnNyKKAqt8sD8uFTmHZiVceTt3qJ+Shb3HwH3aAT+wIwR+cBIRrF\n' +
          'XK//bdqK7LIp/vIzeZTWDDBHOiRtCDVvcDQy8NglD7W9Vxs+nUCjJFbU\n'         +
          '-----END CERTIFICATE-----\n'
      },
      {
        priKey:
          '-----BEGIN PRIVATE KEY-----\n'                                      +
          'MIG6AgEAMBQGByqGSM49AgEGCSskAwMCCAEBDASBnjCBmwIBAQQwI4fbndseEsGX\n' +
          '+jd1AUdDruhqws39fNZMaR7Ks4+Li/u7RWTTQiuoLRLbh+2zve+joWQDYgAES57a\n' +
          'HzsmbXjX00G0iZUiAglt1ESc1wErBl/EJOUykX31KTv7Iqy0fVqbP8L2iTI2Ijpq\n' +
          'gyaK/elNR/kT5Wp6p5hPTvX5+c/nJ0feJQo7diO+xlbab9aeMbVeBiCLiLb/\n'     +
          '-----END PRIVATE KEY-----\n',
        pubKey:
          '-----BEGIN PUBLIC KEY-----\n'                                       +
          'MHowFAYHKoZIzj0CAQYJKyQDAwIIAQEMA2IABEue2h87Jm1419NBtImVIgIJbdRE\n' +
          'nNcBKwZfxCTlMpF99Sk7+yKstH1amz/C9okyNiI6aoMmiv3pTUf5E+VqeqeYT071\n' +
          '+fnP5ydH3iUKO3YjvsZW2m/WnjG1XgYgi4i2/w==\n'                         +
          '-----END PUBLIC KEY-----\n'
      },
      {
        priKey:
          '-----BEGIN EC PRIVATE KEY-----\n'                                   +
          'MIGoAgEBBDBX5QhjzzxEBqgOCoH28xHi+AjFO/Yjwmt4yLuXrz8fPWL+hF9jplPK\n' +
          'vQJ34NWGGGSgCwYJKyQDAwIIAQEMoWQDYgAENc47OqmR+lghgE34nMysPORuijKd\n' +
          'rtSN9JXakwszknK8FJQG8Wb7kkwZ0oqMvXCjHGEZ7a9rYqFRh2iTxrooOMvcAdM1\n' +
          'C8CtUpbVdA6sjgCHCLVgvFoiHX93xc6/Qzu+\n'                             +
          '-----END EC PRIVATE KEY-----\n',
        pubKey:
          '-----BEGIN PUBLIC KEY-----\n'                                       +
          'MHowFAYHKoZIzj0CAQYJKyQDAwIIAQEMA2IABDXOOzqpkfpYIYBN+JzMrDzkbooy\n' +
          'na7UjfSV2pMLM5JyvBSUBvFm+5JMGdKKjL1woxxhGe2va2KhUYdok8a6KDjL3AHT\n' +
          'NQvArVKW1XQOrI4Ahwi1YLxaIh1/d8XOv0M7vg==\n'                         +
          '-----END PUBLIC KEY-----\n'
      }
    ]
  },
  {
    algName: "ECC_BrainPoolP512r1",
    keyPair: [
      {
        priKey:
          '-----BEGIN PRIVATE KEY-----\n'                                      +
          'MIHsAgEAMBQGByqGSM49AgEGCSskAwMCCAEBDQSB0DCBzQIBAQRAMGYawYkj2leU\n' +
          'sxzq3uBJAxThADMKIhvx1/9XTouKom3qal/iufR7FL7RUaCFMG3Cp/+6DD3zx7UJ\n' +
          'uoufe3ZVTqGBhQOBggAEKYnRS+zGcVoXBzaVg2P1wYx/9cIzGWF79XGsA2k7qC1W\n' +
          'ICmGggtAEgL4bBREaHaojvQlcZsnW9d3MY5yLakmaDYt8NbClcF+y3EPd4ta2ALw\n' +
          'jCx//xa5lDjU0h1u5xFvhBY48XnMzoBnU2QQcnbdLJqHx5Q7PcsSvLkScLp4yB8=\n' +
          '-----END PRIVATE KEY-----\n',
        pubKey:
          '-----BEGIN PUBLIC KEY-----\n'                                       +
          'MIGbMBQGByqGSM49AgEGCSskAwMCCAEBDQOBggAEKYnRS+zGcVoXBzaVg2P1wYx/\n' +
          '9cIzGWF79XGsA2k7qC1WICmGggtAEgL4bBREaHaojvQlcZsnW9d3MY5yLakmaDYt\n' +
          '8NbClcF+y3EPd4ta2ALwjCx//xa5lDjU0h1u5xFvhBY48XnMzoBnU2QQcnbdLJqH\n' +
          'x5Q7PcsSvLkScLp4yB8=\n'                                             +
          '-----END PUBLIC KEY-----\n'                                         +
          '-----BEGIN CERTIFICATE-----\n'                                      +
          'MIICeTCCAd6gAwIBAgIULynj49u/vcUkH3w6y04ZWFIjjs8wCgYIKoZIzj0EAwIw\n' +
          'UDELMAkGA1UEBhMCQ04xEDAOBgNVBAgMB3NoYW5neGkxDTALBgNVBAcMBHhpYW4x\n' +
          'DTALBgNVBAoMBHRlc3QxETAPBgNVBAMMCGNlcnR0ZXN0MB4XDTI0MDgxMzAxMjgy\n' +
          'NFoXDTM0MDgxMTAxMjgyNFowUDELMAkGA1UEBhMCQ04xEDAOBgNVBAgMB3NoYW5n\n' +
          'eGkxDTALBgNVBAcMBHhpYW4xDTALBgNVBAoMBHRlc3QxETAPBgNVBAMMCGNlcnR0\n' +
          'ZXN0MIGbMBQGByqGSM49AgEGCSskAwMCCAEBDQOBggAEKYnRS+zGcVoXBzaVg2P1\n' +
          'wYx/9cIzGWF79XGsA2k7qC1WICmGggtAEgL4bBREaHaojvQlcZsnW9d3MY5yLakm\n' +
          'aDYt8NbClcF+y3EPd4ta2ALwjCx//xa5lDjU0h1u5xFvhBY48XnMzoBnU2QQcnbd\n' +
          'LJqHx5Q7PcsSvLkScLp4yB+jUzBRMB0GA1UdDgQWBBQRFek2OY86BaHxd9GhXN0U\n' +
          'gH1MYjAfBgNVHSMEGDAWgBQRFek2OY86BaHxd9GhXN0UgH1MYjAPBgNVHRMBAf8E\n' +
          'BTADAQH/MAoGCCqGSM49BAMCA4GIADCBhAJAWOMgz8eitMYU5MbnJikA7eq0ctXP\n' +
          'Kwqb6st+a4zbvUznA5fC0mXHhmJsnSjd+qkZIha6mBHaklvq+dRhdQVO3gJAYV7u\n' +
          'aMXXdOs5i4DnaBD1BBam9gbgJx3sqjS6deUNwUfYQ28UhpgCTStpDDHGyvb49xFT\n' +
          'cXNsyCl7l5cqzdSVKg==\n'                                             +
          '-----END CERTIFICATE-----\n'
      },
      {
        priKey:
          '-----BEGIN PRIVATE KEY-----\n'                                      +
          'MIHsAgEAMBQGByqGSM49AgEGCSskAwMCCAEBDQSB0DCBzQIBAQRApQZm2TBdOmIF\n' +
          'IHgMhfFX/ySnIUVPvt7oc1Nw9YFcy3HZNkebyd8mxkPI2jiSToEXoHw2rESxCnnh\n' +
          'U/jO826ga6GBhQOBggAEgZ9RhgyFj0lc/7eJBXhB9Lo3NIEzbchkjVmstXFQPgFd\n' +
          '4b4D0rXuIVmEye39X2GSBXGd7GKqaFOVKvVKECgu3gzHVieIkpkdmMRBt2ZPx6i/\n' +
          'RC9gMD07a5wSMLnwIFj2W8bXDy6unjQcE5lOf8ebvAYNPpY2CgRBVao6HUb1hp0=\n' +
          '-----END PRIVATE KEY-----\n',
        pubKey:
          '-----BEGIN PUBLIC KEY-----\n'                                       +
          'MIGbMBQGByqGSM49AgEGCSskAwMCCAEBDQOBggAEgZ9RhgyFj0lc/7eJBXhB9Lo3\n' +
          'NIEzbchkjVmstXFQPgFd4b4D0rXuIVmEye39X2GSBXGd7GKqaFOVKvVKECgu3gzH\n' +
          'VieIkpkdmMRBt2ZPx6i/RC9gMD07a5wSMLnwIFj2W8bXDy6unjQcE5lOf8ebvAYN\n' +
          'PpY2CgRBVao6HUb1hp0=\n'                                             +
          '-----END PUBLIC KEY-----\n'
      },
      {
        priKey:
          '-----BEGIN EC PRIVATE KEY-----\n'                                   +
          'MIHaAgEBBEA+kfrbhJ3W/VCdj6KMvaHEpVlRGkPt8v95GxSn5qbnYmPQr5yNQTra\n' +
          'OZxwS8SgjGDy5cw4R2zu9s2iuQKKEe8xoAsGCSskAwMCCAEBDaGBhQOBggAEcxdv\n' +
          '5Nwgg4MwzQ/tFrniCISLirPI8uBR05ChqZf7NBFRTNNxwOF4qfP0qHgBtQYcvyXZ\n' +
          'PBR5g3xSEIMVWcH0V0F40OSPba7/53WNyMBBOH/eeS/ILMOvGdpSf224uoWR64WB\n' +
          'vnDIj0H7NnTfudDv40bZT5nhqeHrv5O3SsywXJo=\n'                         +
          '-----END EC PRIVATE KEY-----\n',
        pubKey:
          '-----BEGIN PUBLIC KEY-----\n'                                       +
          'MIGbMBQGByqGSM49AgEGCSskAwMCCAEBDQOBggAEcxdv5Nwgg4MwzQ/tFrniCISL\n' +
          'irPI8uBR05ChqZf7NBFRTNNxwOF4qfP0qHgBtQYcvyXZPBR5g3xSEIMVWcH0V0F4\n' +
          '0OSPba7/53WNyMBBOH/eeS/ILMOvGdpSf224uoWR64WBvnDIj0H7NnTfudDv40bZ\n' +
          'T5nhqeHrv5O3SsywXJo=\n'                                             +
          '-----END PUBLIC KEY-----\n'
      }
    ]
  },
  {
    algName: "ECC_BrainPoolP512t1",
    keyPair: [
      {
        priKey:
          '-----BEGIN PRIVATE KEY-----\n'                                      +
          'MIHsAgEAMBQGByqGSM49AgEGCSskAwMCCAEBDgSB0DCBzQIBAQRANcryKSFbHENA\n' +
          'kqIya8F8T/dTftHoZCyjw/+GaiMIGGZ0Jv+nyvUETvKqj51mJI5hAuSYb7DP0pU9\n' +
          '2TtQor/ulKGBhQOBggAEabJW6oX6qEwVsHT2+8fUgj3KUPEZi0BixbluF6JtpZD4\n' +
          'YKM4XOV2R5dRe26hYM03SgHcfJ//+F9ExPiYB0WJZyWTl5/ahdP2k50rl1gxrQZv\n' +
          'lLIx1XNiBBIjllroeh72PdmnNWWX44feoEI7odyJJjlb574lf13JbvPNIICqXeA=\n' +
          '-----END PRIVATE KEY-----\n',
        pubKey:
          '-----BEGIN PUBLIC KEY-----\n'                                       +
          'MIGbMBQGByqGSM49AgEGCSskAwMCCAEBDgOBggAEabJW6oX6qEwVsHT2+8fUgj3K\n' +
          'UPEZi0BixbluF6JtpZD4YKM4XOV2R5dRe26hYM03SgHcfJ//+F9ExPiYB0WJZyWT\n' +
          'l5/ahdP2k50rl1gxrQZvlLIx1XNiBBIjllroeh72PdmnNWWX44feoEI7odyJJjlb\n' +
          '574lf13JbvPNIICqXeA=\n'                                             +
          '-----END PUBLIC KEY-----\n'                                         +
          '-----BEGIN CERTIFICATE-----\n'                                      +
          'MIICeTCCAd6gAwIBAgIUUr3gw7fj+rQ49yZX1n11qAXFoAAwCgYIKoZIzj0EAwIw\n' +
          'UDELMAkGA1UEBhMCQ04xEDAOBgNVBAgMB3NoYW5neGkxDTALBgNVBAcMBHhpYW4x\n' +
          'DTALBgNVBAoMBHRlc3QxETAPBgNVBAMMCGNlcnR0ZXN0MB4XDTI0MDgxMzAxMjgy\n' +
          'NFoXDTM0MDgxMTAxMjgyNFowUDELMAkGA1UEBhMCQ04xEDAOBgNVBAgMB3NoYW5n\n' +
          'eGkxDTALBgNVBAcMBHhpYW4xDTALBgNVBAoMBHRlc3QxETAPBgNVBAMMCGNlcnR0\n' +
          'ZXN0MIGbMBQGByqGSM49AgEGCSskAwMCCAEBDgOBggAEabJW6oX6qEwVsHT2+8fU\n' +
          'gj3KUPEZi0BixbluF6JtpZD4YKM4XOV2R5dRe26hYM03SgHcfJ//+F9ExPiYB0WJ\n' +
          'ZyWTl5/ahdP2k50rl1gxrQZvlLIx1XNiBBIjllroeh72PdmnNWWX44feoEI7odyJ\n' +
          'Jjlb574lf13JbvPNIICqXeCjUzBRMB0GA1UdDgQWBBTHwC/+LhY8/RvULeAKdyW4\n' +
          'm4WCxzAfBgNVHSMEGDAWgBTHwC/+LhY8/RvULeAKdyW4m4WCxzAPBgNVHRMBAf8E\n' +
          'BTADAQH/MAoGCCqGSM49BAMCA4GIADCBhAJAQ6kChsUbtX4c/PPh7i8USPMJz7VQ\n' +
          'ytoPDypxbzJdV21pwoUiUm3mOexpSQxpLlB7LJdyy4nRQ5jqdEETYgPOugJAfHG0\n' +
          'SNw62GwrKIqQfTutUoo0vfI/R18l10MQKcRgBixhx9+Pai99D4ftKG0Ct5AWrMCB\n' +
          'ZweAFIRwFuqjdNQunQ==\n'                                             +
          '-----END CERTIFICATE-----\n'
      },
      {
        priKey:
          '-----BEGIN PRIVATE KEY-----\n'                                      +
          'MIHsAgEAMBQGByqGSM49AgEGCSskAwMCCAEBDgSB0DCBzQIBAQRAjjxN2JFpmjQU\n' +
          'Sna+r5YlMKUFT3UhnGogtqn5rsJXG1N1pKbuSKNmKyVoC2OyMERMeenmrufkauEJ\n' +
          'FjECR7+lo6GBhQOBggAEEV2dJonPtOpUjKaGc77zlkGlSSInIRkl9X00P8+lH5TR\n' +
          'zapCIlGG4U4nveEDoni7JDp6EF9E8FruFF3tzdVY3TysLjrzZLnpU0wDVfbdEJ/N\n' +
          'EIr6jkTsLMKJSAvei1oYFC6/MyT7tr7SgGkIo4RjinOVRoAfIn2QIenM/oX/Zdk=\n' +
          '-----END PRIVATE KEY-----\n',
        pubKey:
          '-----BEGIN PUBLIC KEY-----\n'                                       +
          'MIGbMBQGByqGSM49AgEGCSskAwMCCAEBDgOBggAEEV2dJonPtOpUjKaGc77zlkGl\n' +
          'SSInIRkl9X00P8+lH5TRzapCIlGG4U4nveEDoni7JDp6EF9E8FruFF3tzdVY3Tys\n' +
          'LjrzZLnpU0wDVfbdEJ/NEIr6jkTsLMKJSAvei1oYFC6/MyT7tr7SgGkIo4RjinOV\n' +
          'RoAfIn2QIenM/oX/Zdk=\n'                                             +
          '-----END PUBLIC KEY-----\n'
      },
      {
        priKey:
          '-----BEGIN EC PRIVATE KEY-----\n'                                   +
          'MIHaAgEBBEAYXFwl9b9vPnQPqmB1n500luVRxVvzuJ/0yctTSG5MNxin8z8nFw5u\n' +
          'Al9A71M9+6u3UwDr64+mPJPBbQtQqCUqoAsGCSskAwMCCAEBDqGBhQOBggAEleE1\n' +
          'mee/bi9Zd5TfyApVaTqhVqPuHH4VIIUHdx2cIG91ALkdksMXus7zMD7ftsnzJyCA\n' +
          'pb3aDZs6RAoox68AxGZyY6lnnv8y3bohwxjr4pTHMuCIYQxa3nNMZq9k5+nfHYJv\n' +
          'sOt0gSTHvwi/aiBTHvIeIrpvIQyUlyHAUKcQgj0=\n'                         +
          '-----END EC PRIVATE KEY-----\n',
        pubKey:
          '-----BEGIN PUBLIC KEY-----\n'                                       +
          'MIGbMBQGByqGSM49AgEGCSskAwMCCAEBDgOBggAEleE1mee/bi9Zd5TfyApVaTqh\n' +
          'VqPuHH4VIIUHdx2cIG91ALkdksMXus7zMD7ftsnzJyCApb3aDZs6RAoox68AxGZy\n' +
          'Y6lnnv8y3bohwxjr4pTHMuCIYQxa3nNMZq9k5+nfHYJvsOt0gSTHvwi/aiBTHvIe\n' +
          'IrpvIQyUlyHAUKcQgj0=\n'                                             +
          '-----END PUBLIC KEY-----\n'
      }
    ]
  }
]

export {
  DataBlobMap,
  externalPemData,
  x25519_falsified
}