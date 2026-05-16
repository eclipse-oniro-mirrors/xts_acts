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

#include <crypt.h>
#include <cstring>
#include "test.h"

static char* g_p;

static void CryptExpect(const char* want, const char* salt, const char* key)
{
    g_p = crypt(key, salt);
    if (!g_p) {
        g_p = const_cast<char*>("*");
    }
    if (strcmp(g_p, want) != 0) {
        t_error("crypt(\"%s\", \"%s\") failed: got \"%s\" want \"%s\"\n", key, salt, g_p, want);
    }
}

static void CryptTestMd5Cases()
{
    /* md5 */
    CryptExpect("$1$abcd0123$9Qcg8DyviekV3tDGMZynJ1", "$1$abcd0123$", "Xy01@#\x01\x02\x80\x7f\xff\r\n\x81\t !");
    CryptExpect("$1$$qRPK7m23GJusamGpoGLby/", "$1$$", "");
    CryptExpect("$1$salt$UsdFqFVB.FsuinRDK5eE..", "$1$salt$", "");
    CryptExpect("$1$salt1234$.pylIeU8A8nhxsVrZNOP..", "$1$salt1234$", "Aa@\xaa 0123456789");
    CryptExpect("$1$aaaaaaaa$zqksdEYCs/p2VrrMTPU0x0", "$1$aaaaaaaaaaaaaaaaaaaa$", "aaaaaaaaaaaaaaaaaaaa");
}

static void CryptTestBlowfishCases()
{
    CryptExpect("*", "$2a$00$0123456789012345678901", "");
    CryptExpect("*", "$2a$08$01234567890123456789", "");
    CryptExpect("$2a$04$012345678901234567890u8auMTJmy9uQv1pCMPSGmRjXec5nzCf6", "$2a$04$0123456789012345678901", "");
    CryptExpect("$2a$04$abcdefghijklmnopqrstuuEgxSMhZgdHqm5w1Iw6ZfXSn4If4J406",
                "$2a$04$abcdefghijklmnopqrstuv",
                "\xff\xff\xff\xa3\x33\x01\x40");
    CryptExpect("$2a$04$abcdefghijklmnopqrstuu8J3SjO9LQpndv9O3HW/e0PB1xKk.PJu",
                "$2a$04$abcdefghijklmnopqrstuv",
                "Aa@\xaa 0123456789");
    CryptExpect("$2x$04$abcdefghijklmnopqrstuubUAnPDiHn0JtKfNM4q6HN1ZsdaC1D8i",
                "$2x$04$abcdefghijklmnopqrstuv",
                "\xff\xff\xff\xa3\x33\x01\x40");
    CryptExpect("$2x$04$abcdefghijklmnopqrstuuxYRr8W0rYwastFTc35iurVdXD9PtVhq",
                "$2x$04$abcdefghijklmnopqrstuv",
                "Aa@\xaa 0123456789");
    CryptExpect("$2y$04$abcdefghijklmnopqrstuubUAnPDiHn0JtKfNM4q6HN1ZsdaC1D8i",
                "$2y$04$abcdefghijklmnopqrstuv",
                "\xff\xff\xff\xa3\x33\x01\x40");
    CryptExpect("$2y$04$abcdefghijklmnopqrstuu8J3SjO9LQpndv9O3HW/e0PB1xKk.PJu",
                "$2y$04$abcdefghijklmnopqrstuv",
                "Aa@\xaa 0123456789");
}

static void CryptTestSha256Cases()
{
    /* sha256 */
    CryptExpect("$5$$3c2QQ0KjIU1OLtB29cl8Fplc2WN7X89bnoEjaR7tWu.", "$5$$", "");
    CryptExpect("$5$rounds=1234$abc0123456789$3VfDjPt05VHFn47C/ojFZ6KRPYrOjj1lLbH.dkF3bZ6",
                "$5$rounds=1234$abc0123456789$",
                "Xy01@#\x01\x02\x80\x7f\xff\r\n\x81\t !");
    CryptExpect("$5$salt1234$1145V3OxW91Wl.LSS3pmBHvb2jV3ujiUhD7DgpoJtw9", "$5$salt1234$", "Aa@\xaa 0123456789");
    CryptExpect("$5$rounds=1000$$ZIwsx59lFMWVo3Yt6IxpZVn0IhpY8Yg4gxC21zUDBI4", "$5$rounds=1$", "a");
    CryptExpect("$5$rounds=1234$$i.IiuqtWmTzupHAZtfV/PB33Usz.MwGHq9BKFAEj.B3", "$5$rounds=00001234$", "a");
    /* incompatible with glibc crypt (sha crypt design bugs) */
    // t("*", "$5$rounds=$", "")
    // t("*", "$5$rounds=1234", "")
    // t("*", "$5$rounds=123x$", "")
    // t("*", "$5$rounds=+1234$", "")
    // t("*", "$5$rounds= 1234$", "")
    // t("*", "$5$rounds=1234567890123456789012345678901234567890$", "")
    // t("*", "$5$rounds=  +00$", "")
    // t("*", "$5$rounds=-4294965296$", "")
    /* official tests */
    CryptExpect("$5$saltstring$5B8vYYiY.CVt1RlTTf8KbXBH3hsxY/GNooZaBBGWEc5", "$5$saltstring", "Hello world!");
    CryptExpect("$5$rounds=5000$toolongsaltstrin$Un/5jzAHMgOGZ5.mWJpuVolil07guHPvOW8mGRcvxa5",
                "$5$rounds=5000$toolongsaltstring",
                "This is just a test");
    CryptExpect("$5$rounds=1400$anotherlongsalts$Rx.j8H.h8HjEDGomFU8bDkXm3XIUnzyxf12oP84Bnq1",
                "$5$rounds=1400$anotherlongsaltstring",
                "a very much longer text to encrypt.  This one even stretches over morethan one line.");
    CryptExpect("$5$rounds=1000$roundstoolow$yfvwcWrQ8l/K0DAWyuPMDNHpIVlTQebY9l/gL972bIC",
                "$5$rounds=10$roundstoolow",
                "the minimum number is still observed");
}

static void CryptTestSha512Cases()
{
    /* sha512 */
    CryptExpect(
        "$6$$/chiBau24cE26QQVW3IfIe68Xu5.JQ4E8Ie7lcRLwqxO5cxGuBhqF2HmTL.zWJ9zjChg3yJYFXeGBQ2y3Ba1d1", "$6$$", "");
    CryptExpect(
        "$6$rounds=1234$abc0123456789$BCpt8zLrc/RcyuXmCDOE1ALqMXB2MH6n1g891HhFj8.w7LxGv.FTkqq6Vxc/"
        "km3Y0jE0j24jY5PIv/"
        "oOu6reg1",
        "$6$rounds=1234$abc0123456789$",
        "Xy01@#\x01\x02\x80\x7f\xff\r\n\x81\t !");
    CryptExpect("$6$salt1234$44TYByJTJkEpcbmj8XzV6H7ltUN.7FUFFWKGeph85fMuAME8f1yQnXxqPbz6gfMq7tisOjTrxg3S2DDebWewt1",
                "$6$salt1234$",
                "Aa@\xaa 0123456789");
    CryptExpect(
        "$6$rounds=1000$$hETGMQQ5sXu1md3PrmRCM4AxTgbNpYQaIhk4xQzvCiNfeogfCR9PZGSRXghUOxMAPFU2wuz/"
        "ZLafIHrHopO.60",
        "$6$rounds=1$",
        "a");
    CryptExpect(
        "$6$rounds=1234$$.9spjeVb1fINMikxgAZEpur.ZQ/Gte./HuKWm2sAZ37eK3e1.ZdfRuatKdR/"
        "H..lKQfb2AB.RtHh7xKm.FE2J.",
        "$6$rounds=00001234$",
        "a");
}

int CryptTest()
{
    CryptTestMd5Cases();
    CryptTestBlowfishCases();
    CryptTestSha256Cases();
    CryptTestSha512Cases();

    /* slow tests */
    // t("$5$rounds=10000$saltstringsaltst$3xv.VbSHBb41AL9AvLeujZkZRBAwqFMz2.opqey6IcA",
    //	"$5$rounds=10000$saltstringsaltstring", "Hello world!")
    // t("$5$rounds=77777$short$JiO1O3ZpDAxGJeaDIuqCoEFysAe1mZNJRs3pw0KQRd/",
    //	"$5$rounds=77777$short", "we have a short salt string but not a short password")
    // t("$5$rounds=123456$asaltof16chars..$gP3VQ/6X7UUEW3HkBn2w1/Ptq2jxPyzV/cZKmF/wJvD",
    //	"$5$rounds=123456$asaltof16chars..", "a short string")
    /* incompatible with glibc crypt (sha crypt design bugs) */
    // t("*", "$6$rounds=$", "")
    // t("*", "$6$rounds=1234", "")
    // t("*", "$6$rounds=123x$", "")
    // t("*", "$6$rounds=+1234$", "")
    // t("*", "$6$rounds= 1234$", "")
    // t("*", "$6$rounds=1234567890123456789012345678901234567890$", "")
    // t("*", "$6$rounds=  +00$", "")
    // t("*", "$6$rounds=-4294965296$", "")
    /* official tests */
    CryptExpect("$6$saltstring$svn8UoSVapNtMuq1ukKS4tPQd8iKwSMHWjl/O817G3uBnIFNjnQJuesI68u4OTLiBFdcbYEdFCoEOfaS35inz1",
                "$6$saltstring",
                "Hello world!");
    CryptExpect(
        "$6$rounds=5000$toolongsaltstrin$lQ8jolhgVRVhY4b5pZKaysCLi0QBxGoNeKQzQ3glMhwllF7oGDZxUhx1yxdYcz/"
        "e1JSbq3y6JMxxl8audkUEm0",
        "$6$rounds=5000$toolongsaltstring",
        "This is just a test");
    CryptExpect(
        "$6$rounds=1400$anotherlongsalts$POfYwTEok97VWcjxIiSOjiykti.o/"
        "pQs.wPvMxQ6Fm7I6IoYN3CmLs66x9t0oSwbtEW7o7UmJEiDwGqd8p4ur1",
        "$6$rounds=1400$anotherlongsaltstring",
        "a very much longer text to encrypt.  This one even stretches over morethan one line.");
    CryptExpect(
        "$6$rounds=1000$roundstoolow$kUMsbe306n21p9R.FRkW3IGn."
        "S9NPN0x50YhH1xhLsPuWGsUSklZt58jaTfF4ZEQpyUNGc0dqbpBYYBaHHrsX.",
        "$6$rounds=10$roundstoolow",
        "the minimum number is still observed");
    /* slow tests */
    // t("$6$rounds=10000$saltstringsaltst$OW1/O6BYHV6BcXZu8QVeXbDWra3Oeqh0sbHbbMCVNSnCM/UrjmM0Dp8vOuZeHBy/"
    //   "YTBmSK6H9qs/y3RnOaw5v.",
    //	"$6$rounds=10000$saltstringsaltstring", "Hello world!")
    // t("$6$rounds=77777$short$WuQyW2YR.hBNpjjRhpYD/ifIw05xdfeEyQoMxIXbkvr0gge1a1x3yRULJ5CCaUeOxFmtlcGZelFl5CxtgfiAc0",
    //	"$6$rounds=77777$short", "we have a short salt string but not a short password")
    // t("$6$rounds=123456$asaltof16chars..$BtCwjqMJGx5hrJhZywWvt0RLE8uZ4oPwcelCjmw2kSYu.Ec6ycULevoBK25fs2xX"
    //   "gMNrCzIMVcgEJAstJeonj1",
    //	"$6$rounds=123456$asaltof16chars..", "a short string")
    return T_STATUS;
}
