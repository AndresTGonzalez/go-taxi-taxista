import 'package:app_distribuidas_taxi/providers/viajes_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/widgets.dart';

class ViajesAsignados extends StatelessWidget {
  const ViajesAsignados({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      child: _ViajesAsignadosContent(),
      create: (context) => ViajesProvider(),
    );
  }
}

class _ViajesAsignadosContent extends StatelessWidget {
  const _ViajesAsignadosContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final viajesProvider = Provider.of<ViajesProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15),
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.1,
              alignment: Alignment.centerLeft,
              // color: Colors.red,
              child: Text(
                'Bienvenido',
                style: TextStyle(
                    fontSize: 30,
                    fontFamily: 'Archivo',
                    fontWeight: FontWeight.w700),
              ),
            ),
            Expanded(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.734,
                // color: Colors.red,
                child: ListView.builder(
                  itemBuilder: (context, index) => ViajeCard(
                    solicitud: viajesProvider.viajes[index],
                  ),
                  itemCount: viajesProvider.viajes.length,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
