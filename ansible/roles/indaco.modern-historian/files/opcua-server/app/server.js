/*global require,setInterval,console */
const opcua = require('node-opcua');

// Let's create an instance of OPCUAServer
const server = new opcua.OPCUAServer({
  port: 4334, // the port of the listening socket of the server
  resourcePath: '/UA/DemoOPCUAServer', // this path will be added to the endpoint resource name
  buildInfo: {
    productName: 'DemoOPCUAServer_v1',
    buildNumber: '7659',
    buildDate: new Date(2021, 7, 16),
  },
});

function post_initialize() {
  console.log('initialized');
  function construct_my_address_space(server) {
    const addressSpace = server.engine.addressSpace;
    const namespace = addressSpace.getOwnNamespace();

    /**
     * PUMP
     */
    const pump = namespace.addObject({
      organizedBy: addressSpace.rootFolder.objects,
      browseName: 'DemoPump',
    });

    // Add a variable named ManufacturerName
    namespace.addVariable({
      componentOf: pump,
      browseName: 'ManufacturerName',
      dataType: 'String',
      modellingRule: 'Mandatory',
      value: {
        get: function () {
          return new opcua.Variant({
            dataType: opcua.DataType.String,
            value: 'Sultzer',
          });
        },
      },
    });

    // Add a variable named ModelName
    namespace.addVariable({
      componentOf: pump,
      browseName: 'ModelName',
      dataType: 'String',
      value: {
        get: function () {
          return new opcua.Variant({
            dataType: opcua.DataType.String,
            value: 'ABS-MF-154HW',
          });
        },
      },
    });

    // Add a variable named SerialNumber
    namespace.addVariable({
      componentOf: pump,
      browseName: 'SerialNumber',
      dataType: 'String',
      modellingRule: 'Mandatory',
      value: {
        get: function () {
          return new opcua.Variant({
            dataType: opcua.DataType.String,
            value: '97924244',
          });
        },
      },
    });

    let statusCodeArray = ['CUE', 'FAILURE'];
    // add some variables
    let _statusCode = 'CUE';
    // emulate _statusCode changing every 3000 ms
    setInterval(function () {
      var randomStatusCode = Math.floor(Math.random() * statusCodeArray.length);
      _statusCode = statusCodeArray[randomStatusCode];
    }, 3000);

    // Add a variable named StatusCode
    namespace.addVariable({
      componentOf: pump,
      browseName: 'StatusCode',
      dataType: 'String',
      value: {
        get: function () {
          return new opcua.Variant({
            dataType: opcua.DataType.String,
            value: _statusCode,
          });
        },
      },
    });

    let failuresCodeArray = [
      3, 4, 10, 29, 32, 40, 49, 51, 55, 57, 64, 65, 66, 68, 72, 74, 75, 76, 77,
      83, 84, 85, 88, 93, 105, 155,
    ];

    let _failureCode = 0;
    setInterval(function () {
      let _previousFailureCode = _failureCode;

      if (_statusCode === 'FAILURE') {
        var randomFailureCode = Math.floor(
          Math.random() * failuresCodeArray.length
        );

        _previousFailureCode != 0
          ? (_failureCode = _previousFailureCode)
          : (_failureCode = failuresCodeArray[randomFailureCode]);
      } else {
        _failureCode = 0;
      }
    }, 1000);

    // Add a variable named FaultCode
    namespace.addVariable({
      componentOf: pump,
      browseName: 'FaultCode',
      dataType: 'Int16',
      value: {
        get: function () {
          return new opcua.Variant({
            dataType: opcua.DataType.Int16,
            value: _failureCode,
          });
        },
      },
    });

    // Add a variable named Status
    let _status = '1';
    setInterval(function () {
      let _newStatus = '';
      if (_statusCode === 'FAILURE') {
        _newStatus = '0';
      } else {
        _newStatus = '1';
      }
      _status = _newStatus;

      /*
      console.log('============================');
			console.log('_statusCode : ' + _statusCode);
			console.log('_failureCode: ' + _failureCode);
			console.log('_status: ' + _status);
      */
    }, 1000);

    namespace.addVariable({
      componentOf: pump,
      browseName: 'Status',
      dataType: 'String',
      value: {
        get: function () {
          return new opcua.Variant({
            dataType: opcua.DataType.String,
            value: _status,
          });
        },
      },
    });

    // add a variable named MotorRPM
    let _motorRPM = 2850.0;

    var generateNumber = function (min, max) {
      if (min > max) {
        throw new Error('Minimum value should be smaller than maximum value.');
      }
      var range = max - min;
      return min + range * Math.random();
    };

    setInterval(function () {
      let value = generateNumber(2800.0, 2900.0);
      _motorRPM = value;
    }, 200);

    namespace.addVariable({
      componentOf: pump,
      browseName: 'MotorRPM',
      dataType: 'Double',
      value: {
        get: function () {
          return new opcua.Variant({
            dataType: opcua.DataType.Double,
            value: _motorRPM,
          });
        },
      },
    });

    // add a variable named Temperature
    let _temperature = 30.0;
    // simulate temperature change
    setInterval(function () {
      let value = generateNumber(30.0, 81.0);
      _temperature = value;
    }, 200);

    namespace.addVariable({
      componentOf: pump,
      browseName: 'Temperature',
      dataType: 'Double',
      value: {
        get: function () {
          return new opcua.Variant({
            dataType: opcua.DataType.Double,
            value: _temperature,
          });
        },
      },
    });

    // add a variable named InputPressure
    let _inputPressure = 95.0; //kPA
    // simulate input pressure change
    setInterval(function () {
      let value = generateNumber(93.0, 100.0);
      _inputPressure = value;
    }, 200);

    namespace.addVariable({
      componentOf: pump,
      browseName: 'InputPressure',
      dataType: 'Double',
      value: {
        get: function () {
          return new opcua.Variant({
            dataType: opcua.DataType.Double,
            value: _inputPressure,
          });
        },
      },
    });

    // add a variable named OutputPressure
    let _outputPressure = 100.0;
    // simulate output pressure change
    setInterval(function () {
      let value = generateNumber(100.0, 150.0);
      _outputPressure = value;
    }, 200);

    namespace.addVariable({
      componentOf: pump,
      browseName: 'OutputPressure',
      dataType: 'Double',
      value: {
        get: function () {
          return new opcua.Variant({
            dataType: opcua.DataType.Double,
            value: _outputPressure,
          });
        },
      },
    });
  }
  construct_my_address_space(server);
  server.start(function () {
    console.log('Server is now listening ... ( press CTRL+C to stop)');
    console.log('port ', server.endpoints[0].port);
    const endpointUrl =
      server.endpoints[0].endpointDescriptions()[0].endpointUrl;
    console.log(' the primary server endpoint url is ', endpointUrl);
  });
}
server.initialize(post_initialize);
