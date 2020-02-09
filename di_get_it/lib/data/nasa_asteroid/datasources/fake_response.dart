String getFakeAsteroidResponse() {
  return '''
  {
    "links": {
        "next": "http://www.neowsapp.com/rest/v1/feed?start_date=2019-12-06&end_date=2019-12-07&detailed=false&api_key=DEMO_KEY",
        "prev": "http://www.neowsapp.com/rest/v1/feed?start_date=2019-12-04&end_date=2019-12-05&detailed=false&api_key=DEMO_KEY",
        "self": "http://www.neowsapp.com/rest/v1/feed?start_date=2019-12-05&end_date=2019-12-06&detailed=false&api_key=DEMO_KEY"
    },
    "element_count": 22,
    "near_earth_objects": {
        "2019-12-06": [
            {
                "links": {
                    "self": "http://www.neowsapp.com/rest/v1/neo/3893729?api_key=DEMO_KEY"
                },
                "id": "3893729",
                "neo_reference_id": "3893729",
                "name": "(2019 WB5)",
                "nasa_jpl_url": "http://ssd.jpl.nasa.gov/sbdb.cgi?sstr=3893729",
                "absolute_magnitude_h": 24.367,
                "estimated_diameter": {
                    "kilometers": {
                        "estimated_diameter_min": 0.0355758247,
                        "estimated_diameter_max": 0.0795499624
                    },
                    "meters": {
                        "estimated_diameter_min": 35.5758247121,
                        "estimated_diameter_max": 79.5499624119
                    },
                    "miles": {
                        "estimated_diameter_min": 0.0221057858,
                        "estimated_diameter_max": 0.0494300397
                    },
                    "feet": {
                        "estimated_diameter_min": 116.7185887486,
                        "estimated_diameter_max": 260.9906986796
                    }
                },
                "is_potentially_hazardous_asteroid": false,
                "close_approach_data": [
                    {
                        "close_approach_date": "2019-12-06",
                        "close_approach_date_full": "2019-Dec-06 03:02",
                        "epoch_date_close_approach": 1575601320000,
                        "relative_velocity": {
                            "kilometers_per_second": "22.0431411982",
                            "kilometers_per_hour": "79355.3083133587",
                            "miles_per_hour": "49308.3025461534"
                        },
                        "miss_distance": {
                            "astronomical": "0.0478160438",
                            "lunar": "18.6004410382",
                            "kilometers": "7153178.304306706",
                            "miles": "4444778.8911603028"
                        },
                        "orbiting_body": "Earth"
                    }
                ],
                "is_sentry_object": false
            },
            {
                "links": {
                    "self": "http://www.neowsapp.com/rest/v1/neo/2086326?api_key=DEMO_KEY"
                },
                "id": "2086326",
                "neo_reference_id": "2086326",
                "name": "86326 (1999 WK13)",
                "nasa_jpl_url": "http://ssd.jpl.nasa.gov/sbdb.cgi?sstr=2086326",
                "absolute_magnitude_h": 17.3,
                "estimated_diameter": {
                    "kilometers": {
                        "estimated_diameter_min": 0.9216265485,
                        "estimated_diameter_max": 2.0608196123
                    },
                    "meters": {
                        "estimated_diameter_min": 921.6265485028,
                        "estimated_diameter_max": 2060.8196123208
                    },
                    "miles": {
                        "estimated_diameter_min": 0.5726720101,
                        "estimated_diameter_max": 1.2805335433
                    },
                    "feet": {
                        "estimated_diameter_min": 3023.70924539,
                        "estimated_diameter_max": 6761.2194168867
                    }
                },
                "is_potentially_hazardous_asteroid": false,
                "close_approach_data": [
                    {
                        "close_approach_date": "2019-12-06",
                        "close_approach_date_full": "2019-Dec-06 20:09",
                        "epoch_date_close_approach": 1575662940000,
                        "relative_velocity": {
                            "kilometers_per_second": "21.6770112343",
                            "kilometers_per_hour": "78037.2404434696",
                            "miles_per_hour": "48489.3064299992"
                        },
                        "miss_distance": {
                            "astronomical": "0.4208302355",
                            "lunar": "163.7029616095",
                            "kilometers": "62955306.862398385",
                            "miles": "39118613.730072313"
                        },
                        "orbiting_body": "Earth"
                    }
                ],
                "is_sentry_object": false
            },
            {
                "links": {
                    "self": "http://www.neowsapp.com/rest/v1/neo/3145514?api_key=DEMO_KEY"
                },
                "id": "3145514",
                "neo_reference_id": "3145514",
                "name": "(2003 AA3)",
                "nasa_jpl_url": "http://ssd.jpl.nasa.gov/sbdb.cgi?sstr=3145514",
                "absolute_magnitude_h": 20.2,
                "estimated_diameter": {
                    "kilometers": {
                        "estimated_diameter_min": 0.2424124811,
                        "estimated_diameter_max": 0.5420507863
                    },
                    "meters": {
                        "estimated_diameter_min": 242.4124811008,
                        "estimated_diameter_max": 542.0507863358
                    },
                    "miles": {
                        "estimated_diameter_min": 0.1506280858,
                        "estimated_diameter_max": 0.3368146392
                    },
                    "feet": {
                        "estimated_diameter_min": 795.3165644948,
                        "estimated_diameter_max": 1778.3819018419
                    }
                },
                "is_potentially_hazardous_asteroid": true,
                "close_approach_data": [
                    {
                        "close_approach_date": "2019-12-06",
                        "close_approach_date_full": "2019-Dec-06 22:47",
                        "epoch_date_close_approach": 1575672420000,
                        "relative_velocity": {
                            "kilometers_per_second": "11.8897744037",
                            "kilometers_per_hour": "42803.1878533189",
                            "miles_per_hour": "26596.2363636359"
                        },
                        "miss_distance": {
                            "astronomical": "0.2944541032",
                            "lunar": "114.5426461448",
                            "kilometers": "44049706.651480184",
                            "miles": "27371218.4929631792"
                        },
                        "orbiting_body": "Earth"
                    }
                ],
                "is_sentry_object": false
            },
            {
                "links": {
                    "self": "http://www.neowsapp.com/rest/v1/neo/3893858?api_key=DEMO_KEY"
                },
                "id": "3893858",
                "neo_reference_id": "3893858",
                "name": "(2019 XN)",
                "nasa_jpl_url": "http://ssd.jpl.nasa.gov/sbdb.cgi?sstr=3893858",
                "absolute_magnitude_h": 27.637,
                "estimated_diameter": {
                    "kilometers": {
                        "estimated_diameter_min": 0.0078914167,
                        "estimated_diameter_max": 0.0176457442
                    },
                    "meters": {
                        "estimated_diameter_min": 7.8914167008,
                        "estimated_diameter_max": 17.6457441817
                    },
                    "miles": {
                        "estimated_diameter_min": 0.0049034975,
                        "estimated_diameter_max": 0.0109645537
                    },
                    "feet": {
                        "estimated_diameter_min": 25.8904755686,
                        "estimated_diameter_max": 57.8928633412
                    }
                },
                "is_potentially_hazardous_asteroid": false,
                "close_approach_data": [
                    {
                        "close_approach_date": "2019-12-06",
                        "close_approach_date_full": "2019-Dec-06 11:48",
                        "epoch_date_close_approach": 1575632880000,
                        "relative_velocity": {
                            "kilometers_per_second": "9.718117625",
                            "kilometers_per_hour": "34985.2234498287",
                            "miles_per_hour": "21738.457315256"
                        },
                        "miss_distance": {
                            "astronomical": "0.0062347294",
                            "lunar": "2.4253097366",
                            "kilometers": "932702.238266378",
                            "miles": "579554.2965688964"
                        },
                        "orbiting_body": "Earth"
                    }
                ],
                "is_sentry_object": false
            },
            {
                "links": {
                    "self": "http://www.neowsapp.com/rest/v1/neo/3893459?api_key=DEMO_KEY"
                },
                "id": "3893459",
                "neo_reference_id": "3893459",
                "name": "(2019 WL2)",
                "nasa_jpl_url": "http://ssd.jpl.nasa.gov/sbdb.cgi?sstr=3893459",
                "absolute_magnitude_h": 24.182,
                "estimated_diameter": {
                    "kilometers": {
                        "estimated_diameter_min": 0.0387395861,
                        "estimated_diameter_max": 0.086624348
                    },
                    "meters": {
                        "estimated_diameter_min": 38.7395861242,
                        "estimated_diameter_max": 86.6243479939
                    },
                    "miles": {
                        "estimated_diameter_min": 0.0240716554,
                        "estimated_diameter_max": 0.0538258577
                    },
                    "feet": {
                        "estimated_diameter_min": 127.0983837397,
                        "estimated_diameter_max": 284.2006258724
                    }
                },
                "is_potentially_hazardous_asteroid": false,
                "close_approach_data": [
                    {
                        "close_approach_date": "2019-12-06",
                        "close_approach_date_full": "2019-Dec-06 09:36",
                        "epoch_date_close_approach": 1575624960000,
                        "relative_velocity": {
                            "kilometers_per_second": "3.5122272848",
                            "kilometers_per_hour": "12644.0182253166",
                            "miles_per_hour": "7856.5012133919"
                        },
                        "miss_distance": {
                            "astronomical": "0.1969742081",
                            "lunar": "76.6229669509",
                            "kilometers": "29466921.976696747",
                            "miles": "18309896.2751472286"
                        },
                        "orbiting_body": "Earth"
                    }
                ],
                "is_sentry_object": false
            },
            {
                "links": {
                    "self": "http://www.neowsapp.com/rest/v1/neo/3765642?api_key=DEMO_KEY"
                },
                "id": "3765642",
                "neo_reference_id": "3765642",
                "name": "(2016 XA2)",
                "nasa_jpl_url": "http://ssd.jpl.nasa.gov/sbdb.cgi?sstr=3765642",
                "absolute_magnitude_h": 21.6,
                "estimated_diameter": {
                    "kilometers": {
                        "estimated_diameter_min": 0.1272198785,
                        "estimated_diameter_max": 0.2844722965
                    },
                    "meters": {
                        "estimated_diameter_min": 127.2198785394,
                        "estimated_diameter_max": 284.4722965033
                    },
                    "miles": {
                        "estimated_diameter_min": 0.0790507431,
                        "estimated_diameter_max": 0.1767628354
                    },
                    "feet": {
                        "estimated_diameter_min": 417.3880663071,
                        "estimated_diameter_max": 933.3080892598
                    }
                },
                "is_potentially_hazardous_asteroid": true,
                "close_approach_data": [
                    {
                        "close_approach_date": "2019-12-06",
                        "close_approach_date_full": "2019-Dec-06 16:26",
                        "epoch_date_close_approach": 1575649560000,
                        "relative_velocity": {
                            "kilometers_per_second": "28.7573966401",
                            "kilometers_per_hour": "103526.6279044352",
                            "miles_per_hour": "64327.4205442864"
                        },
                        "miss_distance": {
                            "astronomical": "0.1719328402",
                            "lunar": "66.8818748378",
                            "kilometers": "25720786.676970374",
                            "miles": "15982155.7386602012"
                        },
                        "orbiting_body": "Earth"
                    }
                ],
                "is_sentry_object": false
            },
            {
                "links": {
                    "self": "http://www.neowsapp.com/rest/v1/neo/2137925?api_key=DEMO_KEY"
                },
                "id": "2137925",
                "neo_reference_id": "2137925",
                "name": "137925 (2000 BJ19)",
                "nasa_jpl_url": "http://ssd.jpl.nasa.gov/sbdb.cgi?sstr=2137925",
                "absolute_magnitude_h": 15.9,
                "estimated_diameter": {
                    "kilometers": {
                        "estimated_diameter_min": 1.7561231848,
                        "estimated_diameter_max": 3.9268108181
                    },
                    "meters": {
                        "estimated_diameter_min": 1756.1231848042,
                        "estimated_diameter_max": 3926.8108180856
                    },
                    "miles": {
                        "estimated_diameter_min": 1.0912040195,
                        "estimated_diameter_max": 2.4400063648
                    },
                    "feet": {
                        "estimated_diameter_min": 5761.559189633,
                        "estimated_diameter_max": 12883.2380044079
                    }
                },
                "is_potentially_hazardous_asteroid": false,
                "close_approach_data": [
                    {
                        "close_approach_date": "2019-12-06",
                        "close_approach_date_full": "2019-Dec-06 09:40",
                        "epoch_date_close_approach": 1575625200000,
                        "relative_velocity": {
                            "kilometers_per_second": "23.5698830378",
                            "kilometers_per_hour": "84851.5789361898",
                            "miles_per_hour": "52723.471367323"
                        },
                        "miss_distance": {
                            "astronomical": "0.4631006575",
                            "lunar": "180.1461557675",
                            "kilometers": "69278871.957599525",
                            "miles": "43047894.877042445"
                        },
                        "orbiting_body": "Earth"
                    }
                ],
                "is_sentry_object": false
            },
            {
                "links": {
                    "self": "http://www.neowsapp.com/rest/v1/neo/3063789?api_key=DEMO_KEY"
                },
                "id": "3063789",
                "neo_reference_id": "3063789",
                "name": "(2000 UR16)",
                "nasa_jpl_url": "http://ssd.jpl.nasa.gov/sbdb.cgi?sstr=3063789",
                "absolute_magnitude_h": 23.9,
                "estimated_diameter": {
                    "kilometers": {
                        "estimated_diameter_min": 0.04411182,
                        "estimated_diameter_max": 0.0986370281
                    },
                    "meters": {
                        "estimated_diameter_min": 44.1118199997,
                        "estimated_diameter_max": 98.6370281305
                    },
                    "miles": {
                        "estimated_diameter_min": 0.0274098057,
                        "estimated_diameter_max": 0.0612901888
                    },
                    "feet": {
                        "estimated_diameter_min": 144.7238235278,
                        "estimated_diameter_max": 323.6123073718
                    }
                },
                "is_potentially_hazardous_asteroid": false,
                "close_approach_data": [
                    {
                        "close_approach_date": "2019-12-06",
                        "close_approach_date_full": "2019-Dec-06 02:32",
                        "epoch_date_close_approach": 1575599520000,
                        "relative_velocity": {
                            "kilometers_per_second": "11.2267288073",
                            "kilometers_per_hour": "40416.2237063452",
                            "miles_per_hour": "25113.0696690899"
                        },
                        "miss_distance": {
                            "astronomical": "0.3528558629",
                            "lunar": "137.2609306681",
                            "kilometers": "52786485.506852023",
                            "miles": "32800001.1376949974"
                        },
                        "orbiting_body": "Earth"
                    }
                ],
                "is_sentry_object": false
            },
            {
                "links": {
                    "self": "http://www.neowsapp.com/rest/v1/neo/3328631?api_key=DEMO_KEY"
                },
                "id": "3328631",
                "neo_reference_id": "3328631",
                "name": "(2006 FJ)",
                "nasa_jpl_url": "http://ssd.jpl.nasa.gov/sbdb.cgi?sstr=3328631",
                "absolute_magnitude_h": 20.3,
                "estimated_diameter": {
                    "kilometers": {
                        "estimated_diameter_min": 0.2315021222,
                        "estimated_diameter_max": 0.5176544822
                    },
                    "meters": {
                        "estimated_diameter_min": 231.5021222103,
                        "estimated_diameter_max": 517.6544821978
                    },
                    "miles": {
                        "estimated_diameter_min": 0.1438487052,
                        "estimated_diameter_max": 0.3216554833
                    },
                    "feet": {
                        "estimated_diameter_min": 759.5214226325,
                        "estimated_diameter_max": 1698.3415313737
                    }
                },
                "is_potentially_hazardous_asteroid": false,
                "close_approach_data": [
                    {
                        "close_approach_date": "2019-12-06",
                        "close_approach_date_full": "2019-Dec-06 09:23",
                        "epoch_date_close_approach": 1575624180000,
                        "relative_velocity": {
                            "kilometers_per_second": "14.9222709152",
                            "kilometers_per_hour": "53720.1752947488",
                            "miles_per_hour": "33379.6278102288"
                        },
                        "miss_distance": {
                            "astronomical": "0.4798744989",
                            "lunar": "186.6711800721",
                            "kilometers": "71788202.902757343",
                            "miles": "44607120.8240956134"
                        },
                        "orbiting_body": "Earth"
                    }
                ],
                "is_sentry_object": false
            },
            {
                "links": {
                    "self": "http://www.neowsapp.com/rest/v1/neo/3545558?api_key=DEMO_KEY"
                },
                "id": "3545558",
                "neo_reference_id": "3545558",
                "name": "(2010 RX30)",
                "nasa_jpl_url": "http://ssd.jpl.nasa.gov/sbdb.cgi?sstr=3545558",
                "absolute_magnitude_h": 27.1,
                "estimated_diameter": {
                    "kilometers": {
                        "estimated_diameter_min": 0.0101054342,
                        "estimated_diameter_max": 0.0225964377
                    },
                    "meters": {
                        "estimated_diameter_min": 10.1054341542,
                        "estimated_diameter_max": 22.5964377109
                    },
                    "miles": {
                        "estimated_diameter_min": 0.0062792237,
                        "estimated_diameter_max": 0.0140407711
                    },
                    "feet": {
                        "estimated_diameter_min": 33.1543125905,
                        "estimated_diameter_max": 74.1352966996
                    }
                },
                "is_potentially_hazardous_asteroid": false,
                "close_approach_data": [
                    {
                        "close_approach_date": "2019-12-06",
                        "close_approach_date_full": "2019-Dec-06 23:40",
                        "epoch_date_close_approach": 1575675600000,
                        "relative_velocity": {
                            "kilometers_per_second": "13.6806045981",
                            "kilometers_per_hour": "49250.1765531607",
                            "miles_per_hour": "30602.1444254903"
                        },
                        "miss_distance": {
                            "astronomical": "0.4191960658",
                            "lunar": "163.0672695962",
                            "kilometers": "62710838.556059846",
                            "miles": "38966708.1684680348"
                        },
                        "orbiting_body": "Earth"
                    }
                ],
                "is_sentry_object": false
            },
            {
                "links": {
                    "self": "http://www.neowsapp.com/rest/v1/neo/3634614?api_key=DEMO_KEY"
                },
                "id": "3634614",
                "neo_reference_id": "3634614",
                "name": "(2013 GT66)",
                "nasa_jpl_url": "http://ssd.jpl.nasa.gov/sbdb.cgi?sstr=3634614",
                "absolute_magnitude_h": 25.2,
                "estimated_diameter": {
                    "kilometers": {
                        "estimated_diameter_min": 0.0242412481,
                        "estimated_diameter_max": 0.0542050786
                    },
                    "meters": {
                        "estimated_diameter_min": 24.2412481101,
                        "estimated_diameter_max": 54.2050786336
                    },
                    "miles": {
                        "estimated_diameter_min": 0.0150628086,
                        "estimated_diameter_max": 0.0336814639
                    },
                    "feet": {
                        "estimated_diameter_min": 79.5316564495,
                        "estimated_diameter_max": 177.8381901842
                    }
                },
                "is_potentially_hazardous_asteroid": false,
                "close_approach_data": [
                    {
                        "close_approach_date": "2019-12-06",
                        "close_approach_date_full": "2019-Dec-06 13:32",
                        "epoch_date_close_approach": 1575639120000,
                        "relative_velocity": {
                            "kilometers_per_second": "9.7098161107",
                            "kilometers_per_hour": "34955.337998436",
                            "miles_per_hour": "21719.8876579726"
                        },
                        "miss_distance": {
                            "astronomical": "0.2865942575",
                            "lunar": "111.4851661675",
                            "kilometers": "42873890.476231525",
                            "miles": "26640600.200884045"
                        },
                        "orbiting_body": "Earth"
                    }
                ],
                "is_sentry_object": false
            },
            {
                "links": {
                    "self": "http://www.neowsapp.com/rest/v1/neo/3764806?api_key=DEMO_KEY"
                },
                "id": "3764806",
                "neo_reference_id": "3764806",
                "name": "(2016 WU7)",
                "nasa_jpl_url": "http://ssd.jpl.nasa.gov/sbdb.cgi?sstr=3764806",
                "absolute_magnitude_h": 25.2,
                "estimated_diameter": {
                    "kilometers": {
                        "estimated_diameter_min": 0.0242412481,
                        "estimated_diameter_max": 0.0542050786
                    },
                    "meters": {
                        "estimated_diameter_min": 24.2412481101,
                        "estimated_diameter_max": 54.2050786336
                    },
                    "miles": {
                        "estimated_diameter_min": 0.0150628086,
                        "estimated_diameter_max": 0.0336814639
                    },
                    "feet": {
                        "estimated_diameter_min": 79.5316564495,
                        "estimated_diameter_max": 177.8381901842
                    }
                },
                "is_potentially_hazardous_asteroid": false,
                "close_approach_data": [
                    {
                        "close_approach_date": "2019-12-06",
                        "close_approach_date_full": "2019-Dec-06 04:30",
                        "epoch_date_close_approach": 1575606600000,
                        "relative_velocity": {
                            "kilometers_per_second": "26.9101535592",
                            "kilometers_per_hour": "96876.5528131366",
                            "miles_per_hour": "60195.3224965848"
                        },
                        "miss_distance": {
                            "astronomical": "0.3846287338",
                            "lunar": "149.6205774482",
                            "kilometers": "57539639.317277006",
                            "miles": "35753473.9611384428"
                        },
                        "orbiting_body": "Earth"
                    }
                ],
                "is_sentry_object": false
            },
            {
                "links": {
                    "self": "http://www.neowsapp.com/rest/v1/neo/3843626?api_key=DEMO_KEY"
                },
                "id": "3843626",
                "neo_reference_id": "3843626",
                "name": "(2019 QV3)",
                "nasa_jpl_url": "http://ssd.jpl.nasa.gov/sbdb.cgi?sstr=3843626",
                "absolute_magnitude_h": 21.557,
                "estimated_diameter": {
                    "kilometers": {
                        "estimated_diameter_min": 0.1297642248,
                        "estimated_diameter_max": 0.2901616277
                    },
                    "meters": {
                        "estimated_diameter_min": 129.7642247888,
                        "estimated_diameter_max": 290.1616276754
                    },
                    "miles": {
                        "estimated_diameter_min": 0.0806317261,
                        "estimated_diameter_max": 0.1802980208
                    },
                    "feet": {
                        "estimated_diameter_min": 425.7356592562,
                        "estimated_diameter_max": 951.9738745426
                    }
                },
                "is_potentially_hazardous_asteroid": false,
                "close_approach_data": [
                    {
                        "close_approach_date": "2019-12-06",
                        "close_approach_date_full": "2019-Dec-06 07:15",
                        "epoch_date_close_approach": 1575616500000,
                        "relative_velocity": {
                            "kilometers_per_second": "14.8045849805",
                            "kilometers_per_hour": "53296.5059299084",
                            "miles_per_hour": "33116.3761429478"
                        },
                        "miss_distance": {
                            "astronomical": "0.3931813468",
                            "lunar": "152.9475439052",
                            "kilometers": "58819092.005011316",
                            "miles": "36548488.9959595208"
                        },
                        "orbiting_body": "Earth"
                    }
                ],
                "is_sentry_object": false
            },
            {
                "links": {
                    "self": "http://www.neowsapp.com/rest/v1/neo/3893629?api_key=DEMO_KEY"
                },
                "id": "3893629",
                "neo_reference_id": "3893629",
                "name": "(2019 WR3)",
                "nasa_jpl_url": "http://ssd.jpl.nasa.gov/sbdb.cgi?sstr=3893629",
                "absolute_magnitude_h": 22.794,
                "estimated_diameter": {
                    "kilometers": {
                        "estimated_diameter_min": 0.0734099582,
                        "estimated_diameter_max": 0.1641496567
                    },
                    "meters": {
                        "estimated_diameter_min": 73.4099581704,
                        "estimated_diameter_max": 164.1496566943
                    },
                    "miles": {
                        "estimated_diameter_min": 0.0456148191,
                        "estimated_diameter_max": 0.1019978363
                    },
                    "feet": {
                        "estimated_diameter_min": 240.8463271636,
                        "estimated_diameter_max": 538.5487596691
                    }
                },
                "is_potentially_hazardous_asteroid": false,
                "close_approach_data": [
                    {
                        "close_approach_date": "2019-12-06",
                        "close_approach_date_full": "2019-Dec-06 20:52",
                        "epoch_date_close_approach": 1575665520000,
                        "relative_velocity": {
                            "kilometers_per_second": "7.5117550913",
                            "kilometers_per_hour": "27042.3183285164",
                            "miles_per_hour": "16803.0449636273"
                        },
                        "miss_distance": {
                            "astronomical": "0.0364071739",
                            "lunar": "14.1623906471",
                            "kilometers": "5446435.668159593",
                            "miles": "3384258.1940566634"
                        },
                        "orbiting_body": "Earth"
                    }
                ],
                "is_sentry_object": false
            }
        ],
        "2019-12-05": [
            {
                "links": {
                    "self": "http://www.neowsapp.com/rest/v1/neo/3893382?api_key=DEMO_KEY"
                },
                "id": "3893382",
                "neo_reference_id": "3893382",
                "name": "(2019 WW)",
                "nasa_jpl_url": "http://ssd.jpl.nasa.gov/sbdb.cgi?sstr=3893382",
                "absolute_magnitude_h": 24.582,
                "estimated_diameter": {
                    "kilometers": {
                        "estimated_diameter_min": 0.0322221842,
                        "estimated_diameter_max": 0.0720509944
                    },
                    "meters": {
                        "estimated_diameter_min": 32.2221842456,
                        "estimated_diameter_max": 72.0509943567
                    },
                    "miles": {
                        "estimated_diameter_min": 0.0200219308,
                        "estimated_diameter_max": 0.0447703984
                    },
                    "feet": {
                        "estimated_diameter_min": 105.7158309604,
                        "estimated_diameter_max": 236.3877843253
                    }
                },
                "is_potentially_hazardous_asteroid": false,
                "close_approach_data": [
                    {
                        "close_approach_date": "2019-12-05",
                        "close_approach_date_full": "2019-Dec-05 01:20",
                        "epoch_date_close_approach": 1575508800000,
                        "relative_velocity": {
                            "kilometers_per_second": "9.7747580068",
                            "kilometers_per_hour": "35189.1288244356",
                            "miles_per_hour": "21865.1561853833"
                        },
                        "miss_distance": {
                            "astronomical": "0.0221258643",
                            "lunar": "8.6069612127",
                            "kilometers": "3309982.171189041",
                            "miles": "2056727.5494531258"
                        },
                        "orbiting_body": "Earth"
                    }
                ],
                "is_sentry_object": false
            },
            {
                "links": {
                    "self": "http://www.neowsapp.com/rest/v1/neo/3767159?api_key=DEMO_KEY"
                },
                "id": "3767159",
                "neo_reference_id": "3767159",
                "name": "(2017 BJ30)",
                "nasa_jpl_url": "http://ssd.jpl.nasa.gov/sbdb.cgi?sstr=3767159",
                "absolute_magnitude_h": 26.7,
                "estimated_diameter": {
                    "kilometers": {
                        "estimated_diameter_min": 0.0121494041,
                        "estimated_diameter_max": 0.0271668934
                    },
                    "meters": {
                        "estimated_diameter_min": 12.14940408,
                        "estimated_diameter_max": 27.1668934089
                    },
                    "miles": {
                        "estimated_diameter_min": 0.0075492874,
                        "estimated_diameter_max": 0.0168807197
                    },
                    "feet": {
                        "estimated_diameter_min": 39.8602508817,
                        "estimated_diameter_max": 89.1302305717
                    }
                },
                "is_potentially_hazardous_asteroid": false,
                "close_approach_data": [
                    {
                        "close_approach_date": "2019-12-05",
                        "close_approach_date_full": "2019-Dec-05 07:45",
                        "epoch_date_close_approach": 1575531900000,
                        "relative_velocity": {
                            "kilometers_per_second": "5.1462924875",
                            "kilometers_per_hour": "18526.6529549501",
                            "miles_per_hour": "11511.7416652577"
                        },
                        "miss_distance": {
                            "astronomical": "0.3741730458",
                            "lunar": "145.5533148162",
                            "kilometers": "55975490.663092446",
                            "miles": "34781557.0558139148"
                        },
                        "orbiting_body": "Earth"
                    }
                ],
                "is_sentry_object": false
            },
            {
                "links": {
                    "self": "http://www.neowsapp.com/rest/v1/neo/3794980?api_key=DEMO_KEY"
                },
                "id": "3794980",
                "neo_reference_id": "3794980",
                "name": "(2017 YU1)",
                "nasa_jpl_url": "http://ssd.jpl.nasa.gov/sbdb.cgi?sstr=3794980",
                "absolute_magnitude_h": 26.2,
                "estimated_diameter": {
                    "kilometers": {
                        "estimated_diameter_min": 0.0152951935,
                        "estimated_diameter_max": 0.0342010925
                    },
                    "meters": {
                        "estimated_diameter_min": 15.2951935344,
                        "estimated_diameter_max": 34.201092472
                    },
                    "miles": {
                        "estimated_diameter_min": 0.0095039897,
                        "estimated_diameter_max": 0.021251567
                    },
                    "feet": {
                        "estimated_diameter_min": 50.1810827555,
                        "estimated_diameter_max": 112.2083122258
                    }
                },
                "is_potentially_hazardous_asteroid": false,
                "close_approach_data": [
                    {
                        "close_approach_date": "2019-12-05",
                        "close_approach_date_full": "2019-Dec-05 18:45",
                        "epoch_date_close_approach": 1575571500000,
                        "relative_velocity": {
                            "kilometers_per_second": "14.4850665146",
                            "kilometers_per_hour": "52146.2394524678",
                            "miles_per_hour": "32401.6452864515"
                        },
                        "miss_distance": {
                            "astronomical": "0.2339214506",
                            "lunar": "90.9954442834",
                            "kilometers": "34994150.757070222",
                            "miles": "21744356.9812121836"
                        },
                        "orbiting_body": "Earth"
                    }
                ],
                "is_sentry_object": false
            },
            {
                "links": {
                    "self": "http://www.neowsapp.com/rest/v1/neo/2308242?api_key=DEMO_KEY"
                },
                "id": "2308242",
                "neo_reference_id": "2308242",
                "name": "308242 (2005 GO21)",
                "nasa_jpl_url": "http://ssd.jpl.nasa.gov/sbdb.cgi?sstr=2308242",
                "absolute_magnitude_h": 16.4,
                "estimated_diameter": {
                    "kilometers": {
                        "estimated_diameter_min": 1.3949382293,
                        "estimated_diameter_max": 3.1191767052
                    },
                    "meters": {
                        "estimated_diameter_min": 1394.9382293439,
                        "estimated_diameter_max": 3119.1767052261
                    },
                    "miles": {
                        "estimated_diameter_min": 0.8667741625,
                        "estimated_diameter_max": 1.9381659485
                    },
                    "feet": {
                        "estimated_diameter_min": 4576.5691403606,
                        "estimated_diameter_max": 10233.5197015741
                    }
                },
                "is_potentially_hazardous_asteroid": true,
                "close_approach_data": [
                    {
                        "close_approach_date": "2019-12-05",
                        "close_approach_date_full": "2019-Dec-05 01:51",
                        "epoch_date_close_approach": 1575510660000,
                        "relative_velocity": {
                            "kilometers_per_second": "24.3899231726",
                            "kilometers_per_hour": "87803.7234212254",
                            "miles_per_hour": "54557.8191447053"
                        },
                        "miss_distance": {
                            "astronomical": "0.4993932006",
                            "lunar": "194.2639550334",
                            "kilometers": "74708159.102242722",
                            "miles": "46421497.4726926836"
                        },
                        "orbiting_body": "Earth"
                    }
                ],
                "is_sentry_object": false
            },
            {
                "links": {
                    "self": "http://www.neowsapp.com/rest/v1/neo/3399085?api_key=DEMO_KEY"
                },
                "id": "3399085",
                "neo_reference_id": "3399085",
                "name": "(2008 AF3)",
                "nasa_jpl_url": "http://ssd.jpl.nasa.gov/sbdb.cgi?sstr=3399085",
                "absolute_magnitude_h": 26.1,
                "estimated_diameter": {
                    "kilometers": {
                        "estimated_diameter_min": 0.0160160338,
                        "estimated_diameter_max": 0.0358129403
                    },
                    "meters": {
                        "estimated_diameter_min": 16.0160337979,
                        "estimated_diameter_max": 35.8129403019
                    },
                    "miles": {
                        "estimated_diameter_min": 0.0099518989,
                        "estimated_diameter_max": 0.0222531225
                    },
                    "feet": {
                        "estimated_diameter_min": 52.5460443254,
                        "estimated_diameter_max": 117.4965270602
                    }
                },
                "is_potentially_hazardous_asteroid": false,
                "close_approach_data": [
                    {
                        "close_approach_date": "2019-12-05",
                        "close_approach_date_full": "2019-Dec-05 02:56",
                        "epoch_date_close_approach": 1575514560000,
                        "relative_velocity": {
                            "kilometers_per_second": "15.0056377325",
                            "kilometers_per_hour": "54020.2958369276",
                            "miles_per_hour": "33566.1110437843"
                        },
                        "miss_distance": {
                            "astronomical": "0.3890453698",
                            "lunar": "151.3386488522",
                            "kilometers": "58200358.655442326",
                            "miles": "36164025.9203270588"
                        },
                        "orbiting_body": "Earth"
                    }
                ],
                "is_sentry_object": false
            },
            {
                "links": {
                    "self": "http://www.neowsapp.com/rest/v1/neo/3448992?api_key=DEMO_KEY"
                },
                "id": "3448992",
                "neo_reference_id": "3448992",
                "name": "(2009 DD45)",
                "nasa_jpl_url": "http://ssd.jpl.nasa.gov/sbdb.cgi?sstr=3448992",
                "absolute_magnitude_h": 25.8,
                "estimated_diameter": {
                    "kilometers": {
                        "estimated_diameter_min": 0.0183888672,
                        "estimated_diameter_max": 0.0411187571
                    },
                    "meters": {
                        "estimated_diameter_min": 18.388867207,
                        "estimated_diameter_max": 41.1187571041
                    },
                    "miles": {
                        "estimated_diameter_min": 0.0114263088,
                        "estimated_diameter_max": 0.0255500032
                    },
                    "feet": {
                        "estimated_diameter_min": 60.3309310875,
                        "estimated_diameter_max": 134.9040630575
                    }
                },
                "is_potentially_hazardous_asteroid": false,
                "close_approach_data": [
                    {
                        "close_approach_date": "2019-12-05",
                        "close_approach_date_full": "2019-Dec-05 02:27",
                        "epoch_date_close_approach": 1575512820000,
                        "relative_velocity": {
                            "kilometers_per_second": "4.8252882277",
                            "kilometers_per_hour": "17371.0376195893",
                            "miles_per_hour": "10793.6872364609"
                        },
                        "miss_distance": {
                            "astronomical": "0.418447835",
                            "lunar": "162.776207815",
                            "kilometers": "62598904.82211145",
                            "miles": "38897155.77138001"
                        },
                        "orbiting_body": "Earth"
                    }
                ],
                "is_sentry_object": false
            },
            {
                "links": {
                    "self": "http://www.neowsapp.com/rest/v1/neo/3840123?api_key=DEMO_KEY"
                },
                "id": "3840123",
                "neo_reference_id": "3840123",
                "name": "(2019 FD)",
                "nasa_jpl_url": "http://ssd.jpl.nasa.gov/sbdb.cgi?sstr=3840123",
                "absolute_magnitude_h": 23.319,
                "estimated_diameter": {
                    "kilometers": {
                        "estimated_diameter_min": 0.0576441151,
                        "estimated_diameter_max": 0.1288961598
                    },
                    "meters": {
                        "estimated_diameter_min": 57.6441150906,
                        "estimated_diameter_max": 128.8961598454
                    },
                    "miles": {
                        "estimated_diameter_min": 0.0358183814,
                        "estimated_diameter_max": 0.0800923357
                    },
                    "feet": {
                        "estimated_diameter_min": 189.1211185539,
                        "estimated_diameter_max": 422.8876770672
                    }
                },
                "is_potentially_hazardous_asteroid": false,
                "close_approach_data": [
                    {
                        "close_approach_date": "2019-12-05",
                        "close_approach_date_full": "2019-Dec-05 15:02",
                        "epoch_date_close_approach": 1575558120000,
                        "relative_velocity": {
                            "kilometers_per_second": "8.8817730767",
                            "kilometers_per_hour": "31974.3830762874",
                            "miles_per_hour": "19867.6381953743"
                        },
                        "miss_distance": {
                            "astronomical": "0.2924781053",
                            "lunar": "113.7739829617",
                            "kilometers": "43754101.574515711",
                            "miles": "27187538.0155143718"
                        },
                        "orbiting_body": "Earth"
                    }
                ],
                "is_sentry_object": false
            },
            {
                "links": {
                    "self": "http://www.neowsapp.com/rest/v1/neo/3893213?api_key=DEMO_KEY"
                },
                "id": "3893213",
                "neo_reference_id": "3893213",
                "name": "(2019 VS5)",
                "nasa_jpl_url": "http://ssd.jpl.nasa.gov/sbdb.cgi?sstr=3893213",
                "absolute_magnitude_h": 23.157,
                "estimated_diameter": {
                    "kilometers": {
                        "estimated_diameter_min": 0.0621090629,
                        "estimated_diameter_max": 0.1388800866
                    },
                    "meters": {
                        "estimated_diameter_min": 62.1090628909,
                        "estimated_diameter_max": 138.8800866428
                    },
                    "miles": {
                        "estimated_diameter_min": 0.0385927705,
                        "estimated_diameter_max": 0.0862960583
                    },
                    "feet": {
                        "estimated_diameter_min": 203.7698978949,
                        "estimated_diameter_max": 455.6433434611
                    }
                },
                "is_potentially_hazardous_asteroid": false,
                "close_approach_data": [
                    {
                        "close_approach_date": "2019-12-05",
                        "close_approach_date_full": "2019-Dec-05 11:14",
                        "epoch_date_close_approach": 1575544440000,
                        "relative_velocity": {
                            "kilometers_per_second": "10.7217417139",
                            "kilometers_per_hour": "38598.2701699525",
                            "miles_per_hour": "23983.4640397686"
                        },
                        "miss_distance": {
                            "astronomical": "0.0996190614",
                            "lunar": "38.7518148846",
                            "kilometers": "14902799.396839218",
                            "miles": "9260170.1454004884"
                        },
                        "orbiting_body": "Earth"
                    }
                ],
                "is_sentry_object": false
            }
        ]
    }
}
  ''';
}
