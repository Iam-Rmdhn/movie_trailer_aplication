import 'package:flutter/material.dart';
import 'package:movie_app/core/data/models/movie_detail.dart';

class MovieInfoSection extends StatelessWidget {
  final MovieDetail movieDetail;

  const MovieInfoSection({
    super.key,
    required this.movieDetail,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Genres
          if (movieDetail.genres.isNotEmpty) ...[
            Wrap(
              spacing: 8,
              runSpacing: 4,
              children: movieDetail.genres.map((genre) {
                return Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    genre.name,
                    style: const TextStyle(fontSize: 12),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 16),
          ],

          // Overview
          if (movieDetail.overview.isNotEmpty) ...[
            const Text(
              'Sinopsis',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              movieDetail.overview,
              style: const TextStyle(
                fontSize: 14,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 16),
          ],

          // Movie details
          const Text(
            'Detail Film',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),

          _buildDetailRow('Status', movieDetail.status),
          _buildDetailRow(
              'Bahasa Asli', movieDetail.originalLanguage.toUpperCase()),
          _buildDetailRow('Judul Asli', movieDetail.originalTitle),

          if (movieDetail.budget > 0)
            _buildDetailRow('Budget', _formatCurrency(movieDetail.budget)),

          if (movieDetail.revenue > 0)
            _buildDetailRow('Revenue', _formatCurrency(movieDetail.revenue)),

          if (movieDetail.productionCountries != null)
            _buildDetailRow('Negara', movieDetail.productionCountries!.name),

          // Production companies
          if (movieDetail.productionCompanies.isNotEmpty) ...[
            const SizedBox(height: 8),
            _buildDetailRow(
              'Produksi',
              movieDetail.productionCompanies
                  .take(3)
                  .map((company) => company.name)
                  .join(', '),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child: Text(
              label,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.grey,
              ),
            ),
          ),
          const Text(': '),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }

  String _formatCurrency(int amount) {
    if (amount >= 1000000000) {
      return '\$${(amount / 1000000000).toStringAsFixed(1)}B';
    } else if (amount >= 1000000) {
      return '\$${(amount / 1000000).toStringAsFixed(1)}M';
    } else if (amount >= 1000) {
      return '\$${(amount / 1000).toStringAsFixed(1)}K';
    } else {
      return '\$$amount';
    }
  }
}
