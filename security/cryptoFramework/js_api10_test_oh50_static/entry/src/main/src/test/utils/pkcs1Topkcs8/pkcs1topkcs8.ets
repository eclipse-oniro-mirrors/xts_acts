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
import { BusinessError } from '@ohos.base';
import cryptoFramework from '@ohos.security.cryptoFramework';

let priKeyPkcs1Str512: string =
  "-----BEGIN RSA PRIVATE KEY-----\n"
    + "MIIBOQIBAAJBAKG0KN3tjZM8dCNfCg9bcmZM3Bhv/mRrMxuvua2Ru8Kr1NL+/wye\n"
    + "EMnIARFr+Alf1Tyfjy0PWwFnf8jHWRsz0vkCAwEAAQJAWaTy8vV7AyEEkYdioFjl\n"
    + "9uitK68KrMjxMGwe16ZvHOAcF1+DvEZpALCs6Stn4vh3zas7FNCxCbd5ptCjHHnM\n"
    + "wQIhANCYrfBv6m/kADdb9BYpdhMtp1uH3ucf9yMp9b2cr3V1AiEAxnNzDcvW2aOt\n"
    + "B4+WCEX+tTD3hSBbcv1sKrCApdu3gvUCIEn4WnYQucnDyG/ZI81YFo7meZpzrA+5\n"
    + "viGyF3qNvYqhAiAq/6jWPGx5C7XaBYqEkGX37Hw1JCWsbKybM1MsnMbOYQIgG1P4\n"
    + "2PckY+Ho8KCyXy8ABT6vVE8T7glwpNDQQBE87D0=\n"
    + "-----END RSA PRIVATE KEY-----\n";

let priKeyPkcs8Str512: string =
  "-----BEGIN PRIVATE KEY-----\n"
    + "MIIBUwIBADANBgkqhkiG9w0BAQEFAASCAT0wggE5AgEAAkEAobQo3e2Nkzx0I18K\n"
    + "D1tyZkzcGG/+ZGszG6+5rZG7wqvU0v7/DJ4QycgBEWv4CV/VPJ+PLQ9bAWd/yMdZ\n"
    + "GzPS+QIDAQABAkBZpPLy9XsDIQSRh2KgWOX26K0rrwqsyPEwbB7Xpm8c4BwXX4O8\n"
    + "RmkAsKzpK2fi+HfNqzsU0LEJt3mm0KMceczBAiEA0Jit8G/qb+QAN1v0Fil2Ey2n\n"
    + "W4fe5x/3Iyn1vZyvdXUCIQDGc3MNy9bZo60Hj5YIRf61MPeFIFty/WwqsICl27eC\n"
    + "9QIgSfhadhC5ycPIb9kjzVgWjuZ5mnOsD7m+IbIXeo29iqECICr/qNY8bHkLtdoF\n"
    + "ioSQZffsfDUkJaxsrJszUyycxs5hAiAbU/jY9yRj4ejwoLJfLwAFPq9UTxPuCXCk\n"
    + "0NBAETzsPQ==\n"
    + "-----END PRIVATE KEY-----\n";

let pubKeyPkcs1Str512: string =
  "-----BEGIN RSA PUBLIC KEY-----\n"
    + "MEgCQQChtCjd7Y2TPHQjXwoPW3JmTNwYb/5kazMbr7mtkbvCq9TS/v8MnhDJyAER\n"
    + "a/gJX9U8n48tD1sBZ3/Ix1kbM9L5AgMBAAE=\n"
    + "-----END RSA PUBLIC KEY-----\n";

let pubKeyX509Str512: string =
  "-----BEGIN PUBLIC KEY-----\n"
    + "MFwwDQYJKoZIhvcNAQEBBQADSwAwSAJBAKG0KN3tjZM8dCNfCg9bcmZM3Bhv/mRr\n"
    + "Mxuvua2Ru8Kr1NL+/wyeEMnIARFr+Alf1Tyfjy0PWwFnf8jHWRsz0vkCAwEAAQ==\n"
    + "-----END PUBLIC KEY-----\n";

let priKeyPkcs1Str768: string =
  "-----BEGIN RSA PRIVATE KEY-----\n"
    + "MIIBywIBAAJhAPxoq7Nw6sd9nQHV4vh25TBFFOGJvcyST+ev1vvtQE1BKZ22pg5V\n"
    + "Ktx0Up2zombb7ZmdB0CfyqSH3fQ9im6GHfchE9xPUe47UcF4LDnuvRnzwwFi8AxB\n"
    + "iLSC4BcvsOYR0wIDAQABAmABimIB5l6IeSvMJxILki4z7TgDaGPQK9RxBZG6V+hc\n"
    + "kFlArSy2Sa7JSax3afFDz3PQsdVnasx0JGalmsXdsgDWDKZr+WBC5/8h+DZ74+9a\n"
    + "AYrYfApdUnJd4lEBwXJTtQECMQD+55b0UvdY7tua7jukEhrtE7nHBgfMHZCh5Mye\n"
    + "xIAtT5NNPqDacFiqwOsZjxiRYfsCMQD9flXlxTpfh905rl3Z5Zd8TQziNzgIWeO0\n"
    + "eXuzN4XsEbilfqVc0WMGwqq0YIrK4AkCMQCL/nL4Ymx4Ck7PqxFUTaE+HTxFovk7\n"
    + "T+10DG2YsMDYocB7hu7eqR75QJSd5+oNRmsCMQCKhNKjcBbpxPBaaLHYM+GHhwMX\n"
    + "Sl1QEu6e3BOAZ0LDMRvZM09hXPnj49QsJOUy3yECMHYS7JtNGAbkAkNaQzRmq4Rm\n"
    + "/O7AemtWRCdj0h4bHuR4HBYDYbA/qoonqXDxLG16zA==\n"
    + "-----END RSA PRIVATE KEY-----\n";

let priKeyPkcs8Str768: string =
  "-----BEGIN PRIVATE KEY-----\n"
    + "MIIB5QIBADANBgkqhkiG9w0BAQEFAASCAc8wggHLAgEAAmEA/Girs3Dqx32dAdXi\n"
    + "+HblMEUU4Ym9zJJP56/W++1ATUEpnbamDlUq3HRSnbOiZtvtmZ0HQJ/KpIfd9D2K\n"
    + "boYd9yET3E9R7jtRwXgsOe69GfPDAWLwDEGItILgFy+w5hHTAgMBAAECYAGKYgHm\n"
    + "Xoh5K8wnEguSLjPtOANoY9Ar1HEFkbpX6FyQWUCtLLZJrslJrHdp8UPPc9Cx1Wdq\n"
    + "zHQkZqWaxd2yANYMpmv5YELn/yH4Nnvj71oBith8Cl1Scl3iUQHBclO1AQIxAP7n\n"
    + "lvRS91ju25ruO6QSGu0TuccGB8wdkKHkzJ7EgC1Pk00+oNpwWKrA6xmPGJFh+wIx\n"
    + "AP1+VeXFOl+H3TmuXdnll3xNDOI3OAhZ47R5e7M3hewRuKV+pVzRYwbCqrRgisrg\n"
    + "CQIxAIv+cvhibHgKTs+rEVRNoT4dPEWi+TtP7XQMbZiwwNihwHuG7t6pHvlAlJ3n\n"
    + "6g1GawIxAIqE0qNwFunE8Fposdgz4YeHAxdKXVAS7p7cE4BnQsMxG9kzT2Fc+ePj\n"
    + "1Cwk5TLfIQIwdhLsm00YBuQCQ1pDNGarhGb87sB6a1ZEJ2PSHhse5HgcFgNhsD+q\n"
    + "iiepcPEsbXrM\n"
    + "-----END PRIVATE KEY-----\n";

let pubKeyPkcs1Str768: string =
  "-----BEGIN RSA PUBLIC KEY-----\n"
    + "MGgCYQD8aKuzcOrHfZ0B1eL4duUwRRThib3Mkk/nr9b77UBNQSmdtqYOVSrcdFKd\n"
    + "s6Jm2+2ZnQdAn8qkh930PYpuhh33IRPcT1HuO1HBeCw57r0Z88MBYvAMQYi0guAX\n"
    + "L7DmEdMCAwEAAQ==\n"
    + "-----END RSA PUBLIC KEY-----\n";

let pubKeyX509Str768: string =
  "-----BEGIN PUBLIC KEY-----\n"
    + "MHwwDQYJKoZIhvcNAQEBBQADawAwaAJhAPxoq7Nw6sd9nQHV4vh25TBFFOGJvcyS\n"
    + "T+ev1vvtQE1BKZ22pg5VKtx0Up2zombb7ZmdB0CfyqSH3fQ9im6GHfchE9xPUe47\n"
    + "UcF4LDnuvRnzwwFi8AxBiLSC4BcvsOYR0wIDAQAB\n"
    + "-----END PUBLIC KEY-----\n";

let priKeyPkcs1Str1024: string =
  "-----BEGIN RSA PRIVATE KEY-----\n"
    + "MIICXQIBAAKBgQCwIN3mr21+N96ToxnVnaS+xyK9cNRAHiHGgrbjHw6RAj3V+l+W\n"
    + "Y68IhIe3DudVlzE9oMjeOQwkMkq//HCxNlIlFR6O6pa0mrXSwPRE7YKG97CeKk2g\n"
    + "YOS8YEh8toAvm7xKbiLkXuuMlxrjP2j/mb5iI/UASFSPZiQ/IyxDr0AQaQIDAQAB\n"
    + "AoGAEvBFzBNa+7J4PXnRQlYEK/tvsd0bBZX33ceacMubHl6WVZbphltLq+fMTBPP\n"
    + "LjXmtpC+aJ7Lvmyl+wTi/TsxE9vxW5JnbuRT48rnZ/Xwq0eozDeEeIBRrpsr7Rvr\n"
    + "7ctrgzr4m4yMHq9aDgpxj8IR7oHkfwnmWr0wM3FuiVlj650CQQDineeNZ1hUTkj4\n"
    + "D3O+iCi3mxEVEeJrpqrmSFolRMb+iozrIRKuJlgcOs+Gqi2fHfOTTL7LkpYe8SVg\n"
    + "e3JxUdVLAkEAxvcZXk+byMFoetrnlcMR13VHUpoVeoV9qkv6CAWLlbMdgf7uKmgp\n"
    + "a1Yp3QPDNQQqkPvrqtfR19JWZ4uy1qREmwJALTU3BjyBoH/liqb6fh4HkWk75Som\n"
    + "MzeSjFIOubSYxhq5tgZpBZjcpvUMhV7Zrw54kwASZ+YcUJvmyvKViAm9NQJBAKF7\n"
    + "DyXSKrem8Ws0m1ybM7HQx5As6l3EVhePDmDQT1eyRbKp+xaD74nkJpnwYdB3jyyY\n"
    + "qc7A1tj5J5NmeEFolR0CQQCn76Xp8HCjGgLHw9vg7YyIL28y/XyfFyaZAzzK+Yia\n"
    + "akNwQ6NeGtXSsuGCcyyfpacHp9xy8qXQNKSkw03/5vDO\n"
    + "-----END RSA PRIVATE KEY-----\n";

let priKeyPkcs8Str1024: string =
  "-----BEGIN PRIVATE KEY-----\n"
    + "MIICdwIBADANBgkqhkiG9w0BAQEFAASCAmEwggJdAgEAAoGBALAg3eavbX433pOj\n"
    + "GdWdpL7HIr1w1EAeIcaCtuMfDpECPdX6X5ZjrwiEh7cO51WXMT2gyN45DCQySr/8\n"
    + "cLE2UiUVHo7qlrSatdLA9ETtgob3sJ4qTaBg5LxgSHy2gC+bvEpuIuRe64yXGuM/\n"
    + "aP+ZvmIj9QBIVI9mJD8jLEOvQBBpAgMBAAECgYAS8EXME1r7sng9edFCVgQr+2+x\n"
    + "3RsFlffdx5pwy5seXpZVlumGW0ur58xME88uNea2kL5onsu+bKX7BOL9OzET2/Fb\n"
    + "kmdu5FPjyudn9fCrR6jMN4R4gFGumyvtG+vty2uDOvibjIwer1oOCnGPwhHugeR/\n"
    + "CeZavTAzcW6JWWPrnQJBAOKd541nWFROSPgPc76IKLebERUR4mumquZIWiVExv6K\n"
    + "jOshEq4mWBw6z4aqLZ8d85NMvsuSlh7xJWB7cnFR1UsCQQDG9xleT5vIwWh62ueV\n"
    + "wxHXdUdSmhV6hX2qS/oIBYuVsx2B/u4qaClrVindA8M1BCqQ++uq19HX0lZni7LW\n"
    + "pESbAkAtNTcGPIGgf+WKpvp+HgeRaTvlKiYzN5KMUg65tJjGGrm2BmkFmNym9QyF\n"
    + "XtmvDniTABJn5hxQm+bK8pWICb01AkEAoXsPJdIqt6bxazSbXJszsdDHkCzqXcRW\n"
    + "F48OYNBPV7JFsqn7FoPvieQmmfBh0HePLJipzsDW2Pknk2Z4QWiVHQJBAKfvpenw\n"
    + "cKMaAsfD2+DtjIgvbzL9fJ8XJpkDPMr5iJpqQ3BDo14a1dKy4YJzLJ+lpwen3HLy\n"
    + "pdA0pKTDTf/m8M4=\n"
    + "-----END PRIVATE KEY-----\n";

let pubKeyPkcs1Str1024: string =
  "-----BEGIN RSA PUBLIC KEY-----\n"
    + "MIGJAoGBALAg3eavbX433pOjGdWdpL7HIr1w1EAeIcaCtuMfDpECPdX6X5ZjrwiE\n"
    + "h7cO51WXMT2gyN45DCQySr/8cLE2UiUVHo7qlrSatdLA9ETtgob3sJ4qTaBg5Lxg\n"
    + "SHy2gC+bvEpuIuRe64yXGuM/aP+ZvmIj9QBIVI9mJD8jLEOvQBBpAgMBAAE=\n"
    + "-----END RSA PUBLIC KEY-----\n";

let pubKeyX509Str1024: string =
  "-----BEGIN PUBLIC KEY-----\n"
    + "MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCwIN3mr21+N96ToxnVnaS+xyK9\n"
    + "cNRAHiHGgrbjHw6RAj3V+l+WY68IhIe3DudVlzE9oMjeOQwkMkq//HCxNlIlFR6O\n"
    + "6pa0mrXSwPRE7YKG97CeKk2gYOS8YEh8toAvm7xKbiLkXuuMlxrjP2j/mb5iI/UA\n"
    + "SFSPZiQ/IyxDr0AQaQIDAQAB\n"
    + "-----END PUBLIC KEY-----\n";

let priKeyPkcs1Str2048: string =
  "-----BEGIN RSA PRIVATE KEY-----\n"
    + "MIIEogIBAAKCAQEAr4U12jTPgkgtjUa1Co6iEUOTsgwr9gM2N6SJ479C+EZ4xhcS\n"
    + "z3SAXwkds3p0j88s/M0qjnINYa2p+RtDnPbLezrLXsCa5wTvHVqOIm8mH99GcfHQ\n"
    + "dKPWx2FICbLSgrQu6CyFFjs62aA5yKYeXXC1CSmu29YjcLMvh00OH3h3bYXcPwMq\n"
    + "GiGJ7MWs1iRLbjV5m8FgL8OJntggAB5eYGfkP7dLuuOw8hIT8Xsxuwer/V67O9s5\n"
    + "kweDOxa4UKmj+MrZc9iHzDnt6unRRSr//boHFJAikSUTIaIUDrWG9UkboAA8QFZ5\n"
    + "OAjbw5LpLKnBfxxVxIFeMRI4MVrF//RKRqpUfQIDAQABAoIBAEKvJpWfiNMjnwLU\n"
    + "wUWgiRxsAzoa+7y83aVoQucfLE9tXsdLzt64kWkJ6pncxVo5yQrG3AtAc6sPssss\n"
    + "u5RwA0DvRoLaRD/PFRWe6O9WMTLcvkPeLmeSM7COWjMtGGOGF2goOewHVsWF5U5B\n"
    + "JrozbuRrTL7C7bYMrdsGwH3eY+lc2AY8fJK62m71MGn4+FX9473s9wP3bLjNMI1y\n"
    + "ghwXYxcgeoNWnKoZX/hkHVDvQt44Jgo1jJUdeFNC0RA8je4MnmUmQI1lOT8Bo1XM\n"
    + "p8a6HGykXiX07Al8QUIJWTy+xhfBQdnOsNkYvl1l9SMjyipywCuA1D4Z7bU6DfIG\n"
    + "wx5SK9UCgYEA2AjAuXOkxUnM9qXZiLEf+41zs5JsayPTB2ehvs7sAAzJ9FKs8uP0\n"
    + "ILSuC4YTaQL/D67dheA6NQs9Q3VBznhkdbpOfThFt1vjHxyw7wkquUeo6I7s2Omt\n"
    + "zKwA8v96QizlYRYDyzp9Dx7m1aP3VtgiWgisDCVSgSs1EGEl3i+4racCgYEAz/2/\n"
    + "N/8xLTOoPpo4AQZJQz9ULD1zPgWgUBQchBxE8etkghZu5m8HxawROe/GJqW/B1nV\n"
    + "leVN6aLguOEQevdnMn0mK2Z14JUFf/BHLU7P8T+gc120O6yi6dSzadCxCNzWLfOb\n"
    + "/ZT8r5iw3KuyL/E1xj8eRUbllXQErFCRHKdTGTsCgYASsL8rzEuHHhlzhWnKn7hq\n"
    + "pRRLhvGGW3UYgOjHf1N/tZuLXdPEt+AZLEiaiqEHRtEWZESaHooqqKxGN9DXsibO\n"
    + "4K2Fu+acNIDz4iGUrLBbk02TwTnQkncM7Byw6VWEgCngOm1dmdPUCRJjjWoKw2xF\n"
    + "adaovlni/v/6SM1j6bEKpQKBgCbCfcD8sHhg+Qh5itg+CKcchR4dcX1sZPynUs0X\n"
    + "y41dtYQ8k/wjUsp2j1tBoKaRGrFO/2uIqOVSMhih8IVJ15RkGBncZTkt7DF0YH9E\n"
    + "AaJOniMBolXAjTeQKMMeXe9t4Af+LuKpwhEjHkpxQKqIg+Hm30g/twcL8Nb/yJsT\n"
    + "X3wDAoGATq+mjrkDpW3JXHINoYXcst1Gd4HYFom1XywX44baAVNwQvunEPBdISwS\n"
    + "MfE5Q1tQ9X3H9bPvRbOo6XooOR3xRE5+nRDIbCD5N2yXT1z0wWO/+DE3aqVAxBZE\n"
    + "mZJqaxk4qMyM8vrqfcDa/gbxaaRWZdEriExT2YdmB5lj4IhOTnQ=\n"
    + "-----END RSA PRIVATE KEY-----\n";

let priKeyPkcs1Str2048_B: string =
  "-----BEGIN RSA PRIVATE KEY-----\n"
    + "MIIEjwIBAAKB/gzzxTZPNM7b4J1SpoEZGDYgCCw6iHZjJ34JXt61q7EboTJJJd2w\n"
    + "fzEobHSb93XNsk/QUSWrHS7fQKQQPWcn4NIiXcIfgFYE5g8exHySpLgt0kMI2P3n\n"
    + "fld85LPNYvIiqoeU0rHVZ5N4pOeqs5VjM8i+M+Ye2YiGUOSv2tk7vwhEDsnwIiru\n"
    + "ztC8VOtihlatFqAPF+3A83ZsmOBCZiYJ5vP/oP/iwcrPFCRIALa160nHk0hfXFRA\n"
    + "5aPGYl68a9LeSXju05d4P+xrBkT+aMy7A/0atQ04JYKB7lh3SDAyS/NPKoFBSRaQ\n"
    + "7qjWqXnSw5Qjv3tkhhKW5IKLPEW2lanNAgMBAAECgf4JyMAqdYz70seLsJrNHQrY\n"
    + "IDxsRM8/N0nnAOckr/IB+VA871rma+S5WsMLF6LI39kaR9B09x01gjqPdSEdYteH\n"
    + "haRz9134HP05YNGnFRPPefXC49UfgJdFObh+RuG+7gcKIpdC9WWn1lQkGSRN7kF5\n"
    + "HI2SAa3sXyKOjnVw8pwtJ/uez154JbRl0lw9SxRs7ojq+4+O0bIAGmZ/dsxShdM8\n"
    + "vTTyTmLJABg/YkgguWZsfD2nK2Cqy4WLWYZZ7OGfxrA0kddNc63vTgEDyjUdCP2K\n"
    + "WHZbzuooHIGXO1vjU6/F3K2npin6/0MiznBszWa/cwrLyv7yCw1clDNBJDE/1QJ/\n"
    + "PvkPedBqffLkhea9yEiJIV+vI9S6sG1/qhIV06ztiOihx056xkCbSGnkZrXdVLUQ\n"
    + "O+xctYPbsR3LzTbEIA7wTrBUtr/8XonFyH4x2HYOw4d/+ofy5gDQYigsdEH8qVhD\n"
    + "J5rCnJZgZGZ/zXBizu4jERY0HdHlGY7K/W5x48lxnwJ/NKdoDV9rz8ULJY6gu5x6\n"
    + "eq/1JCaguBsExBhsA5JKuHLGJrYq2Z4Rm3oa7OoDFg+lCAdvVQWGXK3gKJxJqbjJ\n"
    + "GO3pzVvCofmwcniC3cGvBFKnXL7XKfMPMsy5lAH5GuMPgADdDgsX4OPXbgJua8nV\n"
    + "ZsVvb2VJ91o9BPMWeaHlEwJ/CDXvJ6HeELf3xeG1AwU6JAjWzCQzh0dvqtwaznOw\n"
    + "sPYsCdGYvnq0BHgSGLZDuoS1Lir+V4huv6Qz63jlj4yDFq91DDLyE92A1Uhm9WNH\n"
    + "P4VOUXsiV4zpnrLAQRRNfkMM1oAeOc59mPmoVj/+Eh8IoXS0rOKuLWvp2atp3Bpq\n"
    + "3wJ/E6h8vKFniwayBq+dau4c/Dk9eOXDE3li6iOEEEFKDFsth75zeRP+1uFbtCAa\n"
    + "Tt5AayL7ee66H1f7XK4dAnSu/9OzeqxLmlWyfspncYuiYCbLvWCyzEKm5fxxPMUP\n"
    + "z+3+F3g7D8csfxYRlEzsFOoh9mC4Hgre9q6GIZbwSTEcaQJ/CYWTwYZVY1wda6qN\n"
    + "O1gK6I2krxKuTiMa3rwHVADbu5yrCkbWBwA6HRNzhk0waiQQTLuRnCq0Ebd8v+LC\n"
    + "b/KbYpWraV3/sf/UyQua26kS0zkW+WeX/vmloamX/h3PAFzs+caLQOMeqavgGHvE\n"
    + "CJF8Q9MSS07+LBK+U6gWCT2gVQ==\n"
    + "-----END RSA PRIVATE KEY-----\n";

let priKeyPkcs8Str2048: string =
  "-----BEGIN PRIVATE KEY-----\n"
    + "MIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQCvhTXaNM+CSC2N\n"
    + "RrUKjqIRQ5OyDCv2AzY3pInjv0L4RnjGFxLPdIBfCR2zenSPzyz8zSqOcg1hran5\n"
    + "G0Oc9st7OstewJrnBO8dWo4ibyYf30Zx8dB0o9bHYUgJstKCtC7oLIUWOzrZoDnI\n"
    + "ph5dcLUJKa7b1iNwsy+HTQ4feHdthdw/AyoaIYnsxazWJEtuNXmbwWAvw4me2CAA\n"
    + "Hl5gZ+Q/t0u647DyEhPxezG7B6v9Xrs72zmTB4M7FrhQqaP4ytlz2IfMOe3q6dFF\n"
    + "Kv/9ugcUkCKRJRMhohQOtYb1SRugADxAVnk4CNvDkuksqcF/HFXEgV4xEjgxWsX/\n"
    + "9EpGqlR9AgMBAAECggEAQq8mlZ+I0yOfAtTBRaCJHGwDOhr7vLzdpWhC5x8sT21e\n"
    + "x0vO3riRaQnqmdzFWjnJCsbcC0Bzqw+yyyy7lHADQO9GgtpEP88VFZ7o71YxMty+\n"
    + "Q94uZ5IzsI5aMy0YY4YXaCg57AdWxYXlTkEmujNu5GtMvsLttgyt2wbAfd5j6VzY\n"
    + "Bjx8krrabvUwafj4Vf3jvez3A/dsuM0wjXKCHBdjFyB6g1acqhlf+GQdUO9C3jgm\n"
    + "CjWMlR14U0LREDyN7gyeZSZAjWU5PwGjVcynxrocbKReJfTsCXxBQglZPL7GF8FB\n"
    + "2c6w2Ri+XWX1IyPKKnLAK4DUPhnttToN8gbDHlIr1QKBgQDYCMC5c6TFScz2pdmI\n"
    + "sR/7jXOzkmxrI9MHZ6G+zuwADMn0Uqzy4/QgtK4LhhNpAv8Prt2F4Do1Cz1DdUHO\n"
    + "eGR1uk59OEW3W+MfHLDvCSq5R6jojuzY6a3MrADy/3pCLOVhFgPLOn0PHubVo/dW\n"
    + "2CJaCKwMJVKBKzUQYSXeL7itpwKBgQDP/b83/zEtM6g+mjgBBklDP1QsPXM+BaBQ\n"
    + "FByEHETx62SCFm7mbwfFrBE578Ympb8HWdWV5U3pouC44RB692cyfSYrZnXglQV/\n"
    + "8EctTs/xP6BzXbQ7rKLp1LNp0LEI3NYt85v9lPyvmLDcq7Iv8TXGPx5FRuWVdASs\n"
    + "UJEcp1MZOwKBgBKwvyvMS4ceGXOFacqfuGqlFEuG8YZbdRiA6Md/U3+1m4td08S3\n"
    + "4BksSJqKoQdG0RZkRJoeiiqorEY30NeyJs7grYW75pw0gPPiIZSssFuTTZPBOdCS\n"
    + "dwzsHLDpVYSAKeA6bV2Z09QJEmONagrDbEVp1qi+WeL+//pIzWPpsQqlAoGAJsJ9\n"
    + "wPyweGD5CHmK2D4IpxyFHh1xfWxk/KdSzRfLjV21hDyT/CNSynaPW0GgppEasU7/\n"
    + "a4io5VIyGKHwhUnXlGQYGdxlOS3sMXRgf0QBok6eIwGiVcCNN5Aowx5d723gB/4u\n"
    + "4qnCESMeSnFAqoiD4ebfSD+3Bwvw1v/ImxNffAMCgYBOr6aOuQOlbclccg2hhdyy\n"
    + "3UZ3gdgWibVfLBfjhtoBU3BC+6cQ8F0hLBIx8TlDW1D1fcf1s+9Fs6jpeig5HfFE\n"
    + "Tn6dEMhsIPk3bJdPXPTBY7/4MTdqpUDEFkSZkmprGTiozIzy+up9wNr+BvFppFZl\n"
    + "0SuITFPZh2YHmWPgiE5OdA==\n"
    + "-----END PRIVATE KEY-----\n";

let pubKeyPkcs1Str2048: string =
  "-----BEGIN RSA PUBLIC KEY-----\n"
    + "MIIBCgKCAQEAr4U12jTPgkgtjUa1Co6iEUOTsgwr9gM2N6SJ479C+EZ4xhcSz3SA\n"
    + "Xwkds3p0j88s/M0qjnINYa2p+RtDnPbLezrLXsCa5wTvHVqOIm8mH99GcfHQdKPW\n"
    + "x2FICbLSgrQu6CyFFjs62aA5yKYeXXC1CSmu29YjcLMvh00OH3h3bYXcPwMqGiGJ\n"
    + "7MWs1iRLbjV5m8FgL8OJntggAB5eYGfkP7dLuuOw8hIT8Xsxuwer/V67O9s5kweD\n"
    + "Oxa4UKmj+MrZc9iHzDnt6unRRSr//boHFJAikSUTIaIUDrWG9UkboAA8QFZ5OAjb\n"
    + "w5LpLKnBfxxVxIFeMRI4MVrF//RKRqpUfQIDAQAB\n"
    + "-----END RSA PUBLIC KEY-----\n";

let pubKeyX509Str2048: string =
  "-----BEGIN PUBLIC KEY-----\n"
    + "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAr4U12jTPgkgtjUa1Co6i\n"
    + "EUOTsgwr9gM2N6SJ479C+EZ4xhcSz3SAXwkds3p0j88s/M0qjnINYa2p+RtDnPbL\n"
    + "ezrLXsCa5wTvHVqOIm8mH99GcfHQdKPWx2FICbLSgrQu6CyFFjs62aA5yKYeXXC1\n"
    + "CSmu29YjcLMvh00OH3h3bYXcPwMqGiGJ7MWs1iRLbjV5m8FgL8OJntggAB5eYGfk\n"
    + "P7dLuuOw8hIT8Xsxuwer/V67O9s5kweDOxa4UKmj+MrZc9iHzDnt6unRRSr//boH\n"
    + "FJAikSUTIaIUDrWG9UkboAA8QFZ5OAjbw5LpLKnBfxxVxIFeMRI4MVrF//RKRqpU\n"
    + "fQIDAQAB\n"
    + "-----END PUBLIC KEY-----\n";

let priKeyPkcs1Str3072 : string = "-----BEGIN RSA PRIVATE KEY-----\n"
  + "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\n"
  + "-----END RSA PRIVATE KEY-----\n";

let priKeyPkcs8Str3072 : string = "-----BEGIN PRIVATE KEY-----\n"
  + "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\n"
  + "hhYTWfVuTdsBTAXG2zeqbno=\n"
  + "-----END PRIVATE KEY-----\n";

let pubKeyPkcs1Str3072 : string = "-----BEGIN RSA PUBLIC KEY-----\n"
  + "MIIBigKCAYEAyBxneAYLMyWepegDigzAXZUmB3F7WtBJ9YmfAwafMQDqtDMQfHN/\n"
  + "qodxSJ6ZRlvpDkALbiZmw0LpN+DIMJCB3o28L21B0lpcGJDfYFKjdWP2l4sibVv6\n"
  + "9zV/5k2T5asLLSdrm12umkCwm1C1UoT5Ivqde4ipLQFhMYPPzB3/hz3eRTcxZUWm\n"
  + "0uOWsXlvImTP4aXeEFTatBWzglWgtOucUG3cezLIzdyD88ZBi27lzo74ocjIGhDC\n"
  + "4pdS9DvQ+kp9KvYG+DslxOpbTN4SGQaiQkl+k1cJ6keY8cisG30exDFkLyVmfFjP\n"
  + "MfKulc0h03xIY3nPkfC7dc8hB8nzvzZbCzr1cDjJR80ekSEmUfj2eUCMSxaSPvAo\n"
  + "afsxSLTZsjFb+6hTJPJ8GdxtFg1FrzA51QSxhRivobdvqntmQU3K8Ne2KVmq64UH\n"
  + "2a69GcH2oWejG4mIeT4t1gBFZ+peqOsIgq/VeYI2WmNb1co3pvRBuIAcG1sgTaU8\n"
  + "AilKi6YBEcNxAgMBAAE=\n"
  + "-----END RSA PUBLIC KEY-----\n";

let pubKeyX509Str3072 : string = "-----BEGIN PUBLIC KEY-----\n"
  + "MIIBojANBgkqhkiG9w0BAQEFAAOCAY8AMIIBigKCAYEAyBxneAYLMyWepegDigzA\n"
  + "XZUmB3F7WtBJ9YmfAwafMQDqtDMQfHN/qodxSJ6ZRlvpDkALbiZmw0LpN+DIMJCB\n"
  + "3o28L21B0lpcGJDfYFKjdWP2l4sibVv69zV/5k2T5asLLSdrm12umkCwm1C1UoT5\n"
  + "Ivqde4ipLQFhMYPPzB3/hz3eRTcxZUWm0uOWsXlvImTP4aXeEFTatBWzglWgtOuc\n"
  + "UG3cezLIzdyD88ZBi27lzo74ocjIGhDC4pdS9DvQ+kp9KvYG+DslxOpbTN4SGQai\n"
  + "Qkl+k1cJ6keY8cisG30exDFkLyVmfFjPMfKulc0h03xIY3nPkfC7dc8hB8nzvzZb\n"
  + "Czr1cDjJR80ekSEmUfj2eUCMSxaSPvAoafsxSLTZsjFb+6hTJPJ8GdxtFg1FrzA5\n"
  + "1QSxhRivobdvqntmQU3K8Ne2KVmq64UH2a69GcH2oWejG4mIeT4t1gBFZ+peqOsI\n"
  + "gq/VeYI2WmNb1co3pvRBuIAcG1sgTaU8AilKi6YBEcNxAgMBAAE=\n"
  + "-----END PUBLIC KEY-----\n";

let priKeyPkcs1Str4096 : string = "-----BEGIN RSA PRIVATE KEY-----\n"
  + "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\n"
  + "-----END RSA PRIVATE KEY-----\n";

let priKeyPkcs8Str4096 : string= "-----BEGIN PRIVATE KEY-----\n"
  + "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\n"
  + "DFs3kWif9rJG2ygqNdHpa2gQIX3c\n"
  + "-----END PRIVATE KEY-----\n";

let pubKeyPkcs1Str4096 : string = "-----BEGIN RSA PUBLIC KEY-----\n"
  + "MIICCgKCAgEAnDx8bd6se93OKCpW6F5vi9eqAvmocX6X6wo7RfE4Bdt/sBMkKEiz\n"
  + "MM9BBZacBDFX5CnEzZeuj8ILYJlx29jkuQ2nseG56na/YLCfeeHAM4tHEc3WRhM8\n"
  + "GOeMra1mcI4wqS8hbAvFJwrn2Ej5FD/UzCyl4vME3Nf8jgQ3thmsDOLiAgLn0dh8\n"
  + "HKQgq/yAhq33bat+crbhmauBhy9mI+1iLiN0SXX2Jeo6gUuNsKwPIrbTFTYj2Uux\n"
  + "vXK8MvYz9jKVGfKY5ua28yWDBMkS45qAO2L1FV3eCFkb8EiZMSRZ8fqcxGD8dR3A\n"
  + "eyTbb6naguVXfe36qw+LVOnsQONkgmFi6aSIfudhAPfwo9Ekbp3P6Y5pWQB6/8U1\n"
  + "qUGcOvLa2YZ1DSQ4XbRfYf6xXL3dQ/MA1s9qErEBkqpukj1/13wjUKVX7VpPRCg0\n"
  + "eYSKZprocGQ2mrXjA+rb9kaWmWzTOqobMxxk5HtstxTG+I0PiwMO72Z2VESsqkGe\n"
  + "XXrk2tuR/3rGbIxMpUAS/d8sHKUHGERBpyeliGrin+QebNuU1ef6WUp1IXQMLg3x\n"
  + "3MNLvOhXAwEhPjtYFU2RHOTcmycxEadtT6KQIBQhkE2Vr5RF2C9C1vk3hBUlhWLA\n"
  + "ACkQWXvLNisjuMqp4RYhUVdWfZpQn8+PCXFkU6aPaO7QZa+u1DTF6WMCAwEAAQ==\n"
  + "-----END RSA PUBLIC KEY-----\n";

let pubKeyX509Str4096 : string = "-----BEGIN PUBLIC KEY-----\n"
  + "MIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEAnDx8bd6se93OKCpW6F5v\n"
  + "i9eqAvmocX6X6wo7RfE4Bdt/sBMkKEizMM9BBZacBDFX5CnEzZeuj8ILYJlx29jk\n"
  + "uQ2nseG56na/YLCfeeHAM4tHEc3WRhM8GOeMra1mcI4wqS8hbAvFJwrn2Ej5FD/U\n"
  + "zCyl4vME3Nf8jgQ3thmsDOLiAgLn0dh8HKQgq/yAhq33bat+crbhmauBhy9mI+1i\n"
  + "LiN0SXX2Jeo6gUuNsKwPIrbTFTYj2UuxvXK8MvYz9jKVGfKY5ua28yWDBMkS45qA\n"
  + "O2L1FV3eCFkb8EiZMSRZ8fqcxGD8dR3AeyTbb6naguVXfe36qw+LVOnsQONkgmFi\n"
  + "6aSIfudhAPfwo9Ekbp3P6Y5pWQB6/8U1qUGcOvLa2YZ1DSQ4XbRfYf6xXL3dQ/MA\n"
  + "1s9qErEBkqpukj1/13wjUKVX7VpPRCg0eYSKZprocGQ2mrXjA+rb9kaWmWzTOqob\n"
  + "Mxxk5HtstxTG+I0PiwMO72Z2VESsqkGeXXrk2tuR/3rGbIxMpUAS/d8sHKUHGERB\n"
  + "pyeliGrin+QebNuU1ef6WUp1IXQMLg3x3MNLvOhXAwEhPjtYFU2RHOTcmycxEadt\n"
  + "T6KQIBQhkE2Vr5RF2C9C1vk3hBUlhWLAACkQWXvLNisjuMqp4RYhUVdWfZpQn8+P\n"
  + "CXFkU6aPaO7QZa+u1DTF6WMCAwEAAQ==\n"
  + "-----END PUBLIC KEY-----\n";

let priKeyPkcs1Str8192 : string = "-----BEGIN RSA PRIVATE KEY-----\n"
  + "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\n"
  + "-----END RSA PRIVATE KEY-----\n";

let priKeyPkcs8Str8192 : string = "-----BEGIN PRIVATE KEY-----\n"
  + "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\n"
  + "FS1IvRJiXrqD7AfMcI/qhb7zQe8Ofq1ibA==\n"
  + "-----END PRIVATE KEY-----\n";

let pubKeyPkcs1Str8192 : string = "-----BEGIN RSA PUBLIC KEY-----\n"
  + "MIIECgKCBAEAzZanvEfcwMNZiE4KToPs3w2XkUzQGZZvV9jPrr83JG0rE9F1JpGp\n"
  + "bF9y8k8AcE+PEIbyYsvRP4D4fr3JWvieN/PI8hgx+XxkhBHTnJ6GyUKSHKt0d8gg\n"
  + "Yv4WYlznQhvqR3cib6I7JRfOR+CxoeuvO8mhZPsOUdq6JVhiaMwhAeNK8nbS0CuG\n"
  + "IqNXEdkCBL+yN820IT/hO0AYaIupoz6VMTQ1/3gv3nXdJUaBIlqDaoXlw70kVSWX\n"
  + "LlW6XBBG3HS7TWuu9V2oOQ8yHHviIuKYXW9vNZQoVcrRzc65UjjSkenAnVrfUvoL\n"
  + "VpQQY/2aE3MTFVxiKS9mHLXuN/KffMkgWRJ4T05tDBAFtKVmbNUYC6WMIk+zm0Uq\n"
  + "3cE4D3CTKTXAsjOcL11r44aJuAUp1hpMdawGNhigejKJIRA3zkBbv8/h+oEPMw8s\n"
  + "qkooIgDSqM2axUzlRm35fiejX2EwEtnS8JK5BFBfS7GEyDWDgL+04qZ3KH4cSBxm\n"
  + "pxLFTDUiGGmlviPeveoP8G9lRNJSp3tTsO9PU8/DCyAq73FDZpmU70wkBkaNwc2I\n"
  + "E5z6R4ltwttIH1OXNjsH+kWGu0valHivFyXtE6cDCLSEwj7RG9jqx/LI+lS2Q0na\n"
  + "zZWhK4gqh4cDVUHH5GwtiP47JCCSl+ptvo3w8zN2mupq+Nu+svrtimjK3eofqSS3\n"
  + "l/5biSgQv5dmgg4iVqFl84F2CN+qAkHgppjA26f9PdZjz6G/k3FJvLoZ1uoD/TVE\n"
  + "n1XhaxlcMMcd/x/gW7tlVPlUljr5mKaNdKWmmT5oTGs8hjRyD5LLpv63WEqAaEj2\n"
  + "bHRI/lH+s0GLo1KMz5EDdPkq8NqvKkG3zONZt0bKf/WYWzCWtqvIq1AgaWa9b84v\n"
  + "9vXZIk5RLlOtfPlcAtml7yewUp+HCR5Yea/vn17vkh1R8XWxjb+yJVUCc8icFRaY\n"
  + "2J8QICV/qDOzneY8m4LFASs4HDKMIz4zagCSFPCEtefO40P+1eBYK4w9RGBsYnMp\n"
  + "62dY5uVoFW6R2NDXpm63kBvjyHEYYNt3RunSmEhugCIuoPgdW07XRRQU7cuDshdE\n"
  + "Ij062dSRsVH4vpVuOIE2o0peyZjJ5Pomdv5rcu48mWrSgamMccxz03fFQ9c6RMCq\n"
  + "iD0EXA070i4hXUYm5cQCLMqb5VIzoczoraTrnodf6Kl6pJvuYutmXwcRiXYJAc8W\n"
  + "pwL+c15XkSUfedNMWucH9dcSlsL1JqmYlM8cv+gJenr83Wko2bd3GR4/2sNGRKG6\n"
  + "fRinJlUrtTp9X43G6nKcl346CblZYCQ6qK4YA7u+Mn4+CRwiB82KlhLNXLVNxu9f\n"
  + "s3yyBAlRQqDprka8egFTd9zU/b4QNjuUbQIDAQAB\n"
  + "-----END RSA PUBLIC KEY-----\n";

let pubKeyX509Str8192 : string = "-----BEGIN PUBLIC KEY-----\n"
  + "MIIEIjANBgkqhkiG9w0BAQEFAAOCBA8AMIIECgKCBAEAzZanvEfcwMNZiE4KToPs\n"
  + "3w2XkUzQGZZvV9jPrr83JG0rE9F1JpGpbF9y8k8AcE+PEIbyYsvRP4D4fr3JWvie\n"
  + "N/PI8hgx+XxkhBHTnJ6GyUKSHKt0d8ggYv4WYlznQhvqR3cib6I7JRfOR+Cxoeuv\n"
  + "O8mhZPsOUdq6JVhiaMwhAeNK8nbS0CuGIqNXEdkCBL+yN820IT/hO0AYaIupoz6V\n"
  + "MTQ1/3gv3nXdJUaBIlqDaoXlw70kVSWXLlW6XBBG3HS7TWuu9V2oOQ8yHHviIuKY\n"
  + "XW9vNZQoVcrRzc65UjjSkenAnVrfUvoLVpQQY/2aE3MTFVxiKS9mHLXuN/KffMkg\n"
  + "WRJ4T05tDBAFtKVmbNUYC6WMIk+zm0Uq3cE4D3CTKTXAsjOcL11r44aJuAUp1hpM\n"
  + "dawGNhigejKJIRA3zkBbv8/h+oEPMw8sqkooIgDSqM2axUzlRm35fiejX2EwEtnS\n"
  + "8JK5BFBfS7GEyDWDgL+04qZ3KH4cSBxmpxLFTDUiGGmlviPeveoP8G9lRNJSp3tT\n"
  + "sO9PU8/DCyAq73FDZpmU70wkBkaNwc2IE5z6R4ltwttIH1OXNjsH+kWGu0valHiv\n"
  + "FyXtE6cDCLSEwj7RG9jqx/LI+lS2Q0nazZWhK4gqh4cDVUHH5GwtiP47JCCSl+pt\n"
  + "vo3w8zN2mupq+Nu+svrtimjK3eofqSS3l/5biSgQv5dmgg4iVqFl84F2CN+qAkHg\n"
  + "ppjA26f9PdZjz6G/k3FJvLoZ1uoD/TVEn1XhaxlcMMcd/x/gW7tlVPlUljr5mKaN\n"
  + "dKWmmT5oTGs8hjRyD5LLpv63WEqAaEj2bHRI/lH+s0GLo1KMz5EDdPkq8NqvKkG3\n"
  + "zONZt0bKf/WYWzCWtqvIq1AgaWa9b84v9vXZIk5RLlOtfPlcAtml7yewUp+HCR5Y\n"
  + "ea/vn17vkh1R8XWxjb+yJVUCc8icFRaY2J8QICV/qDOzneY8m4LFASs4HDKMIz4z\n"
  + "agCSFPCEtefO40P+1eBYK4w9RGBsYnMp62dY5uVoFW6R2NDXpm63kBvjyHEYYNt3\n"
  + "RunSmEhugCIuoPgdW07XRRQU7cuDshdEIj062dSRsVH4vpVuOIE2o0peyZjJ5Pom\n"
  + "dv5rcu48mWrSgamMccxz03fFQ9c6RMCqiD0EXA070i4hXUYm5cQCLMqb5VIzoczo\n"
  + "raTrnodf6Kl6pJvuYutmXwcRiXYJAc8WpwL+c15XkSUfedNMWucH9dcSlsL1JqmY\n"
  + "lM8cv+gJenr83Wko2bd3GR4/2sNGRKG6fRinJlUrtTp9X43G6nKcl346CblZYCQ6\n"
  + "qK4YA7u+Mn4+CRwiB82KlhLNXLVNxu9fs3yyBAlRQqDprka8egFTd9zU/b4QNjuU\n"
  + "bQIDAQAB\n"
  + "-----END PUBLIC KEY-----\n";

let priKeyError: string = "3082048f0201000281fe0cf3c5364f3404e60f1ec47c92a4b82dd24308d8fde7" +
  "9378a4e7aab3956333c8be33e61ed98808917c43d3124b4efe2c12be53a816093da055";

let pubKeyError: string = "3082048f0201000281fe0cf3c5364f34cedbe09d52a68119183620082c3a88" +
  "7663277e095edeb5abb11ba1324925ddb0";

async function doPrivatePkcs1ToPkcs8ByPromise(algName: string, priKey: string) : Promise<string> {
  let keyPair : cryptoFramework.KeyPair;
  try {
    let rsaGenerator = cryptoFramework.createAsyKeyGenerator(algName);
    keyPair = await rsaGenerator.convertPemKey(null, priKey);
  } catch (error: BusinessError) {
    console.error(`convertPemKey “${error}“, error code: ${error.code}`);
    throw error as Error;
  }
  try {
    let priPemKey = keyPair.priKey;
    let priString = priPemKey.getEncodedPem('PKCS8');
    return priString;
  } catch (error: BusinessError) {
    console.error(`getEncodedPem “${error}“, error code: ${error.code}`);
    throw error as Error;
  }
}

function doPrivatePkcs1ToPkcs8BySync(algName: string, priKey: string) : string {
  let keyPair : cryptoFramework.KeyPair;
  try {
    let rsaGenerator = cryptoFramework.createAsyKeyGenerator(algName);
    keyPair = rsaGenerator.convertPemKeySync(null, priKey);
  } catch (error: BusinessError) {
    console.error(`convertPemKey “${error}“, error code: ${error.code}`);
    throw error as Error;
  }
  try {
    let priPemKey = keyPair.priKey;
    let priString = priPemKey.getEncodedPem('PKCS8');
    return priString;
  } catch (error: BusinessError) {
    console.error(`getEncodedPem “${error}“, error code: ${error.code}`);
    throw error as Error;
  }
}

async function doPrivatePkcs8ToPkcs1ByPromise(algName: string, priKey: string) : Promise<string> {
  let keyPair : cryptoFramework.KeyPair;
  try {
    let rsaGenerator = cryptoFramework.createAsyKeyGenerator(algName);
    keyPair = await rsaGenerator.convertPemKey(null, priKey);
  } catch (error: BusinessError) {
    console.error(`convertPemKey “${error}“, error code: ${error.code}`);
    throw error as Error;
  }
  try {
    let priPemKey = keyPair.priKey;
    let priString = priPemKey.getEncodedPem('PKCS1');
    return priString;
  } catch (error: BusinessError) {
    console.error(`getEncodedPem “${error}“, error code: ${error.code}`);
    throw error as Error;
  }
}

function doPrivatePkcs8ToPkcs1BySync(algName: string, priKey: string) : string {
  let keyPair : cryptoFramework.KeyPair;
  try {
    let rsaGenerator = cryptoFramework.createAsyKeyGenerator(algName);
    keyPair = rsaGenerator.convertPemKeySync(null, priKey);
  } catch (error: BusinessError) {
    console.error(`convertPemKey “${error}“, error code: ${error.code}`);
    throw error as Error;
  }
  try {
    let priPemKey = keyPair.priKey;
    let priString = priPemKey.getEncodedPem('PKCS1');
    return priString;
  } catch (error: BusinessError) {
    console.error(`getEncodedPem “${error}“, error code: ${error.code}`);
    throw error as Error;
  }
}

async function doPublicPkcs1ToX509ByPromise(algName: string, pubKey: string) : Promise<string> {
  let keyPair : cryptoFramework.KeyPair;
  try {
    let rsaGenerator = cryptoFramework.createAsyKeyGenerator(algName);
    keyPair = await rsaGenerator.convertPemKey(pubKey, null);
  } catch (error: BusinessError) {
    console.error(`convertPemKey “${error}“, error code: ${error.code}`);
    throw error as Error;
  }
  try {
    let pubPemKey = keyPair.pubKey;
    let pubString = pubPemKey.getEncodedPem('X509');
    return pubString;
  } catch (error: BusinessError) {
    console.error(`getEncodedPem “${error}“, error code: ${error.code}`);
    throw error as Error;
  }
}

function doPublicPkcs1ToX509BySync(algName: string, pubKey: string) : string {
  let keyPair : cryptoFramework.KeyPair;
  try {
    let rsaGenerator = cryptoFramework.createAsyKeyGenerator(algName);
    keyPair = rsaGenerator.convertPemKeySync(pubKey, null);
  } catch (error: BusinessError) {
    console.error(`convertPemKey “${error}“, error code: ${error.code}`);
    throw error as Error;
  }
  try {
    let pubPemKey = keyPair.pubKey;
    let pubString = pubPemKey.getEncodedPem('X509');
    return pubString;
  } catch (error: BusinessError) {
    console.error(`getEncodedPem “${error}“, error code: ${error.code}`);
    throw error as Error;
  }
}

async function doPublicX509ToPkcs1ByPromise(algName: string, pubKey: string) : Promise<string> {
  let keyPair : cryptoFramework.KeyPair;
  try {
    let rsaGenerator = cryptoFramework.createAsyKeyGenerator(algName);
    keyPair = await rsaGenerator.convertPemKey(pubKey, null);
  } catch (error: BusinessError) {
    console.error(`convertPemKey “${error}“, error code: ${error.code}`);
    throw error as Error;
  }
  try {
    let pubPemKey = keyPair.pubKey;
    let pubString = pubPemKey.getEncodedPem('PKCS1');
    return pubString;
  } catch (error: BusinessError) {
    console.error(`getEncodedPem “${error}“, error code: ${error.code}`);
    throw error as Error;
  }
}

function doPublicX509ToPkcs1BySync(algName: string, pubKey: string) : string {
  let keyPair : cryptoFramework.KeyPair;
  try {
    let rsaGenerator = cryptoFramework.createAsyKeyGenerator(algName);
    keyPair = rsaGenerator.convertPemKeySync(pubKey, null);
  } catch (error: BusinessError) {
    console.error(`convertPemKey “${error}“, error code: ${error.code}`);
    throw error as Error;
  }
  try {
    let pubPemKey = keyPair.pubKey;
    let pubString = pubPemKey.getEncodedPem('PKCS1');
    return pubString;
  } catch (error: BusinessError) {
    console.error(`getEncodedPem “${error}“, error code: ${error.code}`);
    throw error as Error;
  }
}

function doPubGetEncodedPemX509(keyPair: cryptoFramework.KeyPair) : string {
  try {
    let pubPemKey = keyPair.pubKey;
    let pubString = pubPemKey.getEncodedPem('X509');
    return pubString;
  } catch (error: BusinessError) {
    console.error(`getEncodedPem “${error}“, error code: ${error.code}`);
    throw error as Error;
  }
}

function doPubGetEncodedPemPkcs1(keyPair: cryptoFramework.KeyPair) : string {
  try {
    let pubPemKey = keyPair.pubKey;
    let pubString = pubPemKey.getEncodedPem('PKCS1');
    return pubString;
  } catch (error: BusinessError) {
    console.error(`getEncodedPem “${error}“, error code: ${error.code}`);
    throw error as Error;
  }
}

function doPriGetEncodedPemPkcs1(keyPair: cryptoFramework.KeyPair) : string {
  try {
    let priPemKey = keyPair.priKey;
    let priString = priPemKey.getEncodedPem('PKCS1');
    return priString;
  } catch (error: BusinessError) {
    console.error(`getEncodedPem “${error}“, error code: ${error.code}`);
    throw error as Error;
  }
}

function doPriGetEncodedPemPkcs8(keyPair: cryptoFramework.KeyPair) : string {
  try {
    let priPemKey = keyPair.priKey;
    let priString = priPemKey.getEncodedPem('PKCS8');
    return priString;
  } catch (error: BusinessError) {
    console.error(`getEncodedPem “${error}“, error code: ${error.code}`);
    throw error as Error;
  }
}

async function doConvertPemKeyByPromise(algName: string, pubKey: string, priKey: string) : Promise<cryptoFramework.KeyPair> {
  let keyPair : cryptoFramework.KeyPair;
  try {
    let rsaGenerator = cryptoFramework.createAsyKeyGenerator(algName);
    keyPair = await rsaGenerator.convertPemKey(pubKey, priKey);
    return keyPair;
  } catch (error: BusinessError) {
    console.error(`convertPemKey “${error}“, error code: ${error.code}`);
    throw error as Error;
  }
}

function doConvertPemKeyBySync(algName: string, pubKey: string, priKey: string) : cryptoFramework.KeyPair {
  let keyPair : cryptoFramework.KeyPair;
  try {
    let rsaGenerator = cryptoFramework.createAsyKeyGenerator(algName);
    keyPair = rsaGenerator.convertPemKeySync(pubKey, priKey);
    return keyPair;
  } catch (error: BusinessError) {
    console.error(`convertPemKey “${error}“, error code: ${error.code}`);
    throw error as Error;
  }
}

export {
  doPrivatePkcs1ToPkcs8ByPromise,
  doPrivatePkcs1ToPkcs8BySync,
  doPrivatePkcs8ToPkcs1ByPromise,
  doPrivatePkcs8ToPkcs1BySync,
  doPublicPkcs1ToX509ByPromise,
  doPublicPkcs1ToX509BySync,
  doPublicX509ToPkcs1ByPromise,
  doPublicX509ToPkcs1BySync,
  doPubGetEncodedPemX509,
  doPubGetEncodedPemPkcs1,
  doPriGetEncodedPemPkcs1,
  doPriGetEncodedPemPkcs8,
  doConvertPemKeyByPromise,
  doConvertPemKeyBySync,
  priKeyPkcs1Str512,
  priKeyPkcs8Str512,
  pubKeyPkcs1Str512,
  pubKeyX509Str512,
  priKeyPkcs1Str768,
  priKeyPkcs8Str768,
  pubKeyPkcs1Str768,
  pubKeyX509Str768,
  priKeyPkcs1Str1024,
  priKeyPkcs8Str1024,
  pubKeyPkcs1Str1024,
  pubKeyX509Str1024,
  priKeyPkcs1Str2048,
  priKeyPkcs1Str2048_B,
  priKeyPkcs8Str2048,
  pubKeyPkcs1Str2048,
  pubKeyX509Str2048,
  priKeyPkcs1Str3072,
  priKeyPkcs8Str3072,
  pubKeyPkcs1Str3072,
  pubKeyX509Str3072,
  priKeyPkcs1Str4096,
  priKeyPkcs8Str4096,
  pubKeyPkcs1Str4096,
  pubKeyX509Str4096,
  priKeyPkcs1Str8192,
  priKeyPkcs8Str8192,
  pubKeyPkcs1Str8192,
  pubKeyX509Str8192,
  priKeyError,
  pubKeyError
}



